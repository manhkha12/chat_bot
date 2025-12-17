import 'package:flutter/material.dart';
import 'package:smart_home/shared/extensions/extensions.dart';
import 'package:smart_home/shared/widgets/app_text.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();
  
  // Mock data - Lịch học trong tuần
  final Map<String, List<ScheduleItem>> weekSchedule = {
    'Thứ 2': [
      ScheduleItem(
        period: 4,
        subject: 'A708',
        subjectName: 'Thực tập tốt nghiệp (CS313)',
        room: 'LHP: 251CS22.03',
        slots: 3,
        credits: 4,
        building: '19g20',
        instructor: 'GV: Quách Đình Viên',
        email: 'vienqd@thainguyen.edu.vn',
        color: Colors.orange,
      ),
      ScheduleItem(
        period: 7,
        subject: 'B810',
        subjectName: 'Tiếng Anh trung cấp 3 (GE323)',
        room: 'LHP: 251GE33317',
        slots: 2,
        credits: 3,
        building: '19g30',
        instructor: 'GV: Nguyễn Thị Kim Phượng',
        email: 'phuongntk@thainguyen.edu.vn',
        color: Colors.red,
      ),
    ],
    'Thứ 3': [
      ScheduleItem(
        period: 9,
        subject: 'A503',
        subjectName: 'Tiếng Pháp 2 (GF102)',
        room: 'LHP: 241_GF102_04',
        slots: 2,
        credits: 2,
        building: '8-10',
        instructor: 'GV: Doãng Việt Trung',
        email: 'trungtdv@thainguyen.edu.vn',
        color: Colors.purple,
      ),
    ],
    'Thứ 4': [],
    'Thứ 5': [
      ScheduleItem(
        period: 4,
        subject: 'A709',
        subjectName: 'Luật đại cương Đại học Không thường (BS334)',
        room: 'LHP: 251BS33403',
        slots: 3,
        credits: 4,
        building: '19g20',
        instructor: 'GV: Nguyễn Xuân Thanh',
        email: 'thanhvx@thainguyen.edu.vn',
        color: Colors.orange,
      ),
      ScheduleItem(
        period: 9,
        subject: 'A503',
        subjectName: 'Tiếng Pháp 2 (GF102)',
        room: 'LHP: 241_GF102_04',
        slots: 2,
        credits: 2,
        building: '8-10',
        instructor: 'GV: Doãng Việt Trung',
        email: 'trungtdv@thainguyen.edu.vn',
        color: Colors.purple,
      ),
    ],
    'Thứ 6': [],
    'Thứ 7': [
      ScheduleItem(
        period: 7,
        subject: 'B712',
        subjectName: 'Dự án Công nghệ thông tin (IT486)',
        room: 'LHP: 251IT48003',
        slots: 4,
        credits: 2,
        building: '7-9',
        instructor: 'GV: Nguyễn Hùng Cường',
        email: 'cuongnh@thainguyen.edu.vn',
        color: Colors.blue,
      ),
    ],
    'Chủ nhật': [
      ScheduleItem(
        period: 7,
        subject: 'BOMON',
        subjectName: 'Thực tập tốt nghiệp ngành Công nghệ thông tin (IP406)',
        room: 'LHP: 241IP40602',
        slots: 2,
        credits: 2,
        building: '19g30',
        instructor: 'GV:',
        email: 'Email:',
        color: Colors.green,
      ),
    ],
  };

  final List<String> timeSlots = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'
  ];

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        title: const AppText(
          'Lịch học trong tuần',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            color: Colors.white,
            onPressed: () {
              // TODO: Show week picker
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.date_range, size: 20, color: Colors.grey.shade700),
                    const SizedBox(width: 8),
                    AppText(
                      'Tuần 15: 15/04/2025 - 21/04/2025',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 20, color: Colors.blue.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppText(
                        'Tiết học: 1 tiết = 50 phút',
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Table
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header row
                  _buildHeaderRow(),
                  
                  // Divider
                  Divider(height: 1, color: Colors.grey.shade300),
                  
                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _verticalController,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time column (fixed)
                          _buildTimeColumn(),
                          
                          // Schedule columns (scrollable)
                          Expanded(
                            child: SingleChildScrollView(
                              controller: _horizontalController,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: weekSchedule.keys.map((day) {
                                  return _buildDayColumn(day, weekSchedule[day]!);
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      color: Colors.red.shade700,
      child: Row(
        children: [
          // Time header
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Center(
              child: AppText(
                'Tiết',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          
          // Day headers
          Expanded(
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: weekSchedule.keys.map((day) {
                  final date = _getDateForDay(day);
                  return Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.red.shade800, width: 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        AppText(
                          day,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          date,
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeColumn() {
    return Container(
      width: 50,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Column(
        children: timeSlots.map((slot) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
            child: Center(
              child: AppText(
                slot,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDayColumn(String day, List<ScheduleItem> schedules) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Stack(
        children: [
          // Empty cells background
          Column(
            children: List.generate(timeSlots.length, (index) {
              return Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
              );
            }),
          ),
          
          // Schedule items
          ...schedules.map((schedule) {
            return _buildScheduleCard(schedule);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(ScheduleItem schedule) {
    final top = (schedule.period - 1) * 80.0;
    final height = schedule.slots * 80.0 - 8;
    
    return Positioned(
      top: top + 4,
      left: 4,
      right: 4,
      height: height,
      child: GestureDetector(
        onTap: () => _showScheduleDetail(schedule),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: schedule.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: schedule.color.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                schedule.subject,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: schedule.color,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: AppText(
                  schedule.subjectName,
                  fontSize: 11,
                  color: Colors.black87,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              AppText(
                schedule.room,
                fontSize: 10,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showScheduleDetail(ScheduleItem schedule) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: schedule.color.withOpacity(0.1),
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: schedule.color,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: AppText(
                      schedule.subject,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppText(
                      schedule.subjectName,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                      icon: Icons.class_outlined,
                      label: 'Lớp học phần',
                      value: schedule.room,
                    ),
                    _buildDetailRow(
                      icon: Icons.timer_outlined,
                      label: 'Số tiết',
                      value: '${schedule.slots} tiết',
                    ),
                    _buildDetailRow(
                      icon: Icons.star_outline,
                      label: 'Số tín chỉ',
                      value: '${schedule.credits} TC',
                    ),
                    _buildDetailRow(
                      icon: Icons.access_time_outlined,
                      label: 'Tiết học',
                      value: 'Tiết ${schedule.period} - ${schedule.period + schedule.slots - 1}',
                    ),
                    _buildDetailRow(
                      icon: Icons.business_outlined,
                      label: 'Giờ bắt đầu',
                      value: schedule.building,
                    ),
                    _buildDetailRow(
                      icon: Icons.person_outline,
                      label: 'Giảng viên',
                      value: schedule.instructor,
                    ),
                    _buildDetailRow(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: schedule.email,
                      isEmail: true,
                    ),
                  ],
                ),
              ),
            ),
            
            // Close button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: schedule.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const AppText(
                    'Đóng',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    bool isEmail = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  label,
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(height: 4),
                AppText(
                  value,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isEmail ? Colors.blue.shade700 : Colors.black87,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDateForDay(String day) {
    // Mock dates - you can replace with actual date calculation
    final dates = {
      'Thứ 2': '15/04/2025',
      'Thứ 3': '16/04/2025',
      'Thứ 4': '17/04/2025',
      'Thứ 5': '18/04/2025',
      'Thứ 6': '19/04/2025',
      'Thứ 7': '20/04/2025',
      'Chủ nhật': '21/04/2025',
    };
    return dates[day] ?? '';
  }
}

// Model class
class ScheduleItem {
  final int period; 
  final String subject; 
  final String subjectName; 
  final String room; 
  final int slots; 
  final int credits; 
  final String building; 
  final String instructor; 
  final String email; 
  final Color color; 

  ScheduleItem({
    required this.period,
    required this.subject,
    required this.subjectName,
    required this.room,
    required this.slots,
    required this.credits,
    required this.building,
    required this.instructor,
    required this.email,
    required this.color,
  });
}