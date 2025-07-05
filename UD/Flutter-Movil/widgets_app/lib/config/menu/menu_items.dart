import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbars y dialogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated',
    subTitle: 'Animaciones en Flutter',
    link: '/animated',
    icon: Icons.animation,
  ),
  MenuItems(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui_controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    title: 'App Tutorial',
    subTitle: 'Tutorial de la aplicación',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItems(
    title: 'Infinite Scroll y pull',
    subTitle: 'listas infinitas y pull to refresh',
    link: '/infinite_scroll',
    icon: Icons.list_alt_rounded,
  ),
];
