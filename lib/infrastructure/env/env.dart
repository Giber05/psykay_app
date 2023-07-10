enum ENV {
  dev(baseURL: "https://4c5e-118-99-124-30.ngrok-free.app"),
  prod(baseURL: "https://4c5e-118-99-124-30.ngrok-free.app");

  final String baseURL;

  const ENV({required this.baseURL});

  static ENV current = ENV.dev;

  static void setEnv(ENV env) => current = env;
}
