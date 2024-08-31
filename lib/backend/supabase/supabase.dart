import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://nsoghqqtwvbssfeqjrtf.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zb2docXF0d3Zic3NmZXFqcnRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUwMzUxNDAsImV4cCI6MjA0MDYxMTE0MH0.POytBQ0lSHpaWY0QMB8aPBPWGf9o0Ao7bjiyITteav0';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
