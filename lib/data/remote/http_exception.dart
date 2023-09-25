class HttHandlerException{


String handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 304:
        return 'Not modified';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 422:
        return 'Data validation failed.';
      default:
        return 'Oops something went wrong!';
    }
  }



}