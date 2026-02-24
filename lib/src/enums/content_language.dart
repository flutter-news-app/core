import 'package:json_annotation/json_annotation.dart';

/// {@template content_language}
/// A strict, enumerated contract for supported content languages.
///
/// This enum acts as the single source of truth for:
/// 1. API Content Negotiation (Client requests content in `es`).
/// 2. Content Creation (Dashboard enforces `en` vs `es` fields).
/// 3. Fallback Logic (System defaults to `en` if requested lang is missing).
/// {@endtemplate}
@JsonEnum()
enum ContentLanguage {
  /// English (Default / Fallback).
  en,

  /// Spanish.
  es,

  /// French.
  fr,

  /// Arabic.
  ar,

  /// Portuguese.
  pt,

  /// German.
  de,

  /// Italian.
  it,

  /// Mandarin Chinese.
  zh,

  /// Hindi.
  hi,

  /// Japanese.
  ja,
}
