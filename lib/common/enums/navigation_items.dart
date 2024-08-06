import 'package:riverpod_clean_arch/data/services/local_storage_service.dart';
import 'package:flutter/material.dart';

enum NavigationItems {
  student,
  logout,
}

enum NavigationItemsSuperAdmin {
  student,
  teacher,
  backup,
  logout,
}

extension NavigationItemsExtensionsSuperAdmin on NavigationItemsSuperAdmin {
  IconData get icon {
    switch (this) {
      case NavigationItemsSuperAdmin.student:
        return Icons.school_outlined;
      case NavigationItemsSuperAdmin.teacher:
        return Icons.supervisor_account_outlined;
      case NavigationItemsSuperAdmin.backup:
        return Icons.backup_rounded;
      case NavigationItemsSuperAdmin.logout:
        return Icons.logout;
      default:
        return Icons.person;
    }
  }
}

extension NavigationItemsExtensions on NavigationItems {
  IconData get icon {
    switch (this) {
      case NavigationItems.student:
        return Icons.school_outlined;
      case NavigationItems.logout:
        return Icons.logout;
      default:
        return Icons.person;
    }
  }
}
