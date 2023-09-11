class AppRouterConfiguration {
  final String pageName;
  final String? resourceId;

  AppRouterConfiguration.home(): pageName = '', resourceId = null;
  AppRouterConfiguration.about(): pageName = 'About', resourceId = null;

  AppRouterConfiguration.postShow(this.resourceId) : pageName = 'PostShow';

  bool get isHomePage => pageName == '';
  bool get isAboutPage => pageName == 'About';
  bool get isPostShow => pageName == 'PostShow' && resourceId != null;
}