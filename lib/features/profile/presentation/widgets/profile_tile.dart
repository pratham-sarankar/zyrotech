import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../dark_mode.dart';
import '../../../../screens/config/common.dart';

enum TileType {
  regular,
  withSwitch,
  withBadge,
  withCountryFlag,
  logout,
}

class ProfileTileBadge {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const ProfileTileBadge({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 10,
  });

  static const ProfileTileBadge verified = ProfileTileBadge(
    text: "Verified",
    backgroundColor: Color(0xffE8F5E9),
    textColor: Color(0xff2E7D32),
  );
}

class ProfileTile extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final VoidCallback? onTap;
  final TileType tileType;
  final ProfileTileBadge? badge;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final String? countryFlagImage;
  final double imageScale;
  final bool centerImage;
  final Widget? trailingWidget;

  const ProfileTile({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    this.onTap,
    this.tileType = TileType.regular,
    this.badge,
    this.switchValue,
    this.onSwitchChanged,
    this.countryFlagImage,
    this.imageScale = 3,
    this.centerImage = false,
    this.trailingWidget,
  });

  const ProfileTile.regular({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    this.onTap,
    this.imageScale = 3,
    this.centerImage = false,
    this.trailingWidget,
  })  : tileType = TileType.regular,
        badge = null,
        switchValue = null,
        onSwitchChanged = null,
        countryFlagImage = null;

  const ProfileTile.withSwitch({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.switchValue,
    required this.onSwitchChanged,
    this.imageScale = 3,
    this.centerImage = false,
  })  : tileType = TileType.withSwitch,
        onTap = null,
        badge = null,
        countryFlagImage = null,
        trailingWidget = null;

  const ProfileTile.withBadge({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.badge,
    this.onTap,
    this.imageScale = 3,
    this.centerImage = false,
  })  : tileType = TileType.withBadge,
        switchValue = null,
        onSwitchChanged = null,
        countryFlagImage = null,
        trailingWidget = null;

  const ProfileTile.withCountryFlag({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.countryFlagImage,
    this.onTap,
    this.imageScale = 3,
    this.centerImage = false,
  })  : tileType = TileType.withCountryFlag,
        badge = null,
        switchValue = null,
        onSwitchChanged = null,
        trailingWidget = null;

  const ProfileTile.logout({
    super.key,
    required this.onTap,
  })  : image = "",
        name = "Logout",
        description = "",
        tileType = TileType.logout,
        badge = null,
        switchValue = null,
        onSwitchChanged = null,
        countryFlagImage = null,
        imageScale = 3,
        centerImage = false,
        trailingWidget = null;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ColorNotifire>(context, listen: true);

    switch (tileType) {
      case TileType.logout:
        return _buildLogoutTile(notifier);
      default:
        return _buildRegularTile(notifier);
    }
  }

  Widget _buildLogoutTile(ColorNotifire notifier) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: notifier.background,
          border: Border.all(color: notifier.getContainerBorder),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.logout,
                color: notifier.textColor,
                size: 24,
              ),
              const SizedBox(width: 15),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Manrope-Bold",
                  fontSize: 16,
                  color: notifier.textColor,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: notifier.tabBarText2,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegularTile(ColorNotifire notifier) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getContainerBorder),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                _buildIconContainer(notifier),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppConstants.Height(20),
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Manrope_bold",
                              fontSize: 14,
                              color: notifier.textColor,
                            ),
                          ),
                          if (badge != null) ...[
                            const SizedBox(width: 8),
                            _buildBadge(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 7),
                      Text(
                        description,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Manrope_bold",
                          fontSize: 12,
                          letterSpacing: 0.2,
                          color: Color(0xff64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildTrailingWidget(notifier),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer(ColorNotifire notifier) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: notifier.tabBar1,
      ),
      child: centerImage
          ? Center(
              child: Image.asset(
                image,
                scale: imageScale,
                color: notifier.passwordIcon,
              ),
            )
          : Image.asset(
              image,
              scale: imageScale,
              color: notifier.passwordIcon,
            ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: badge!.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        badge!.text,
        style: TextStyle(
          color: badge!.textColor,
          fontSize: badge!.fontSize,
          fontFamily: "Manrope-Regular",
        ),
      ),
    );
  }

  Widget _buildTrailingWidget(ColorNotifire notifier) {
    if (trailingWidget != null) {
      return trailingWidget!;
    }

    switch (tileType) {
      case TileType.withCountryFlag:
        if (countryFlagImage != null) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(countryFlagImage!),
              ),
              const SizedBox(width: 8),
              _buildArrowIcon(notifier),
            ],
          );
        }
        break;
      case TileType.withSwitch:
        return Switch(
          value: switchValue ?? false,
          onChanged: onSwitchChanged,
        );
      default:
        break;
    }

    return _buildArrowIcon(notifier);
  }

  Widget _buildArrowIcon(ColorNotifire notifier) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: notifier.tabBarText2,
          size: 18,
        ),
      ),
    );
  }
}
