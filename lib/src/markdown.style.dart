import 'package:bleck_markdown/src/css_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

const Color separatorColor = Color(0xFFD7DDE3);
Border bottomLine = Border(
  bottom: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: separatorColor.withOpacity(0.5),
  ),
);

Style _headline = Style(
  margin: Margins.only(
    top: 24,
    bottom: 16,
  ),
  fontWeight: FontWeight.w600,
  lineHeight: const LineHeight(1.25),
);
Style _list = Style(
  margin: Margins.symmetric(vertical: 0),
  // padding: EdgeInsets.only(left: emToPx(2)),
);
Style _tableCell = Style(
  padding: HtmlPaddings.symmetric(
    vertical: 6,
    horizontal: 13,
  ),
  border: Border.all(
    width: 1,
    style: BorderStyle.solid,
    color: const Color(0xFFD0D7DE),
  ),
);

Map<String, Style> markdownStyle = {
  'h1': _headline.copyWith(
    margin: Margins.symmetric(
      horizontal: 0,
      vertical: emToPx(0.67),
    ),
    padding: HtmlPaddings.only(bottom: emToPx(0.3)),
    fontSize: FontSize(2, Unit.em),
    border: bottomLine,
  ),
  'h2': _headline.copyWith(
    padding: HtmlPaddings.only(bottom: emToPx(0.3)),
    fontSize: FontSize(1.5, Unit.em),
    border: bottomLine,
  ),
  'h3': _headline.copyWith(
    fontSize: FontSize(1.25, Unit.em),
  ),
  'h4': _headline.copyWith(
    fontSize: FontSize(1, Unit.em),
  ),
  'h5': _headline.copyWith(
    fontSize: FontSize(0.875, Unit.em),
  ),
  'h6': _headline.copyWith(
    fontSize: FontSize(0.85, Unit.em),
    color: const Color(0xFF57606A),
  ),
  'p': Style(
    margin: Margins.only(
      top: 0,
      bottom: 10,
    ),
  ),
  'hr': Style(
    height: Height(emToPx(0.25)),
    padding: HtmlPaddings.zero,
    margin: Margins.symmetric(
      vertical: 24,
      horizontal: 0,
    ),
    backgroundColor: separatorColor,
  ),
  'blockquote': Style(
    margin: Margins.only(top: 0, bottom: 16),
    padding: HtmlPaddings.symmetric(
      horizontal: 0,
      vertical: 0,
    ),
    color: const Color(0xFF57606A),
  ),
  // 'blockquote>:first-child': Style(margin: const EdgeInsets.only(top: 0)),
  // 'blockquote>:last-child': Style(margin: const EdgeInsets.only(bottom: 0)),
  'dl': Style(
    padding: HtmlPaddings.zero,
  ),
  'dt': Style(
    padding: HtmlPaddings.zero,
    margin: Margins.only(top: 16),
    fontSize: FontSize(1),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
  ),
  'dd': Style(
    padding: HtmlPaddings.symmetric(
      vertical: 0,
      horizontal: 16,
    ),
    margin: Margins.only(bottom: 16),
  ),
  'ol': _list.copyWith(padding: HtmlPaddings.only(left: 0)),
  'ol ol': _list.copyWith(
    listStyleType: ListStyleType.lowerRoman,
    margin: Margins.symmetric(vertical: 0),
  ),
  'ol ul': _list.copyWith(
    margin: Margins.symmetric(vertical: 0),
  ),
  'ol ol ol': _list.copyWith(listStyleType: ListStyleType.lowerAlpha),
  'ol ul ol': _list.copyWith(listStyleType: ListStyleType.lowerAlpha),
  'ul': _list,
  'ul ul': _list.copyWith(
    margin: Margins.symmetric(vertical: 0),
  ),
  'ul ol': _list.copyWith(
    listStyleType: ListStyleType.lowerRoman,
    margin: Margins.symmetric(vertical: 0),
  ),
  'ul ol ol': _list.copyWith(listStyleType: ListStyleType.lowerAlpha),
  'ul ul ol': _list.copyWith(listStyleType: ListStyleType.lowerAlpha),
  '.task-list-item': _list.copyWith(
    listStyleType: ListStyleType.none,
    padding: HtmlPaddings.zero,
  ),
  'th': _tableCell.copyWith(
    fontWeight: FontWeight.w600,
    backgroundColor: Colors.transparent,
  ),
  'td': _tableCell,
  'tr': Style(
    backgroundColor: Colors.transparent,
    border: const Border(
      top: BorderSide(
        width: 0.5,
        style: BorderStyle.solid,
        color: separatorColor,
      ),
    ),
  ),
  'h1 code, h2 code, h3 code, h4 code, h5 code, h6 code': Style(
    padding: HtmlPaddings.symmetric(
      vertical: 0,
      horizontal: emToPx(0.2),
    ),
  ),
};
