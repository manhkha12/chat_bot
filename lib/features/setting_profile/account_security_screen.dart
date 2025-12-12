import 'package:flutter/material.dart';
import 'package:smart_home/features/setting_profile/change_password_screen.dart';
import 'package:smart_home/features/setting_profile/forgot_password_screen.dart';
import 'package:smart_home/shared/widgets/app_text.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const AppText(
          'Account Security',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // UC5: Change Password
            _buildSecurityItem(
              context,
              icon: Icons.lock_reset_rounded,
              title: 'Đổi mật khẩu',
              subtitle: 'Thay đổi mật khẩu của bạn',
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // UC4: Forgot Password
            _buildSecurityItem(
              context,
              icon: Icons.help_outline_rounded,
              title: 'Quên mật khẩu',
              subtitle: 'Đặt lại mật khẩu qua email',
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Two-Factor Authentication (Optional)
            _buildSecurityItem(
              context,
              icon: Icons.security_rounded,
              title: 'Xác thực 2 lớp',
              subtitle: 'Tăng cường bảo mật tài khoản',
              color: Colors.green,
              onTap: () {
                // TODO: Implement 2FA
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      subtitle,
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey.shade400,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
