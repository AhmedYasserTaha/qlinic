import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/book/presentation/view/widget/booking_confirmation_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDateTimeView extends StatefulWidget {
  final DoctorModel doctor;

  const BookingDateTimeView({super.key, required this.doctor});

  @override
  State<BookingDateTimeView> createState() => _BookingDateTimeViewState();
}

class _BookingDateTimeViewState extends State<BookingDateTimeView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedTimeIndex = -1;
  int _selectedReminderIndex = -1;

  final List<String> _timeSlots = [
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
    "02:00 PM",
    "02:30 PM",
  ];

  final List<String> _reminderSlots = [
    "15 Mins",
    "30 Mins",
    "45 Mins",
    "1 Hour",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          "Select Date & Time",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar
              TableCalendar(
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Gap(30.h),
              CustomText(
                "Available Time",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              Gap(20.h),
              // Time Selector
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _timeSlots.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedTimeIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTimeIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.secondaryColor
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            _timeSlots[index],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(30.h),
              CustomText(
                "Reminder Me Before",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              Gap(20.h),
              // Reminder Selector
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _reminderSlots.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedReminderIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedReminderIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.secondaryColor
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            _reminderSlots[index],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(30.h),
              CustomButton(
                text: "Confirm",
                onTap: () {
                  if (_selectedDay != null && _selectedTimeIndex != -1) {
                    showDialog(
                      context: context,
                      builder: (context) => BookingConfirmationDialog(
                        doctor: widget.doctor,
                        date: _selectedDay!,
                        time: _timeSlots[_selectedTimeIndex],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select date and time"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                width: double.infinity,
                color: AppColors.secondaryColor,
                textColor: Colors.white,
                height: 50.h,
                radius: 10.sp,
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
