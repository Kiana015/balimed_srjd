<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use GuzzleHttp\Client;
use Throwable;
use Illuminate\Support\Facades\Auth;

class Handler extends ExceptionHandler
{
    /**
     * A list of exception types with their corresponding custom log levels.
     *
     * @var array<class-string<\Throwable>, \Psr\Log\LogLevel::*>
     */
    protected $levels = [
        //
    ];

    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<\Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        $botTele = false;

        if ($botTele) {
            $this->renderable(function (Throwable $e, $request) {
                $sendReport = true;
                if ($sendReport) {
                    $nama = '-';
                    if (Auth::check()) {
                        $nama = Auth::user()->name;
                    }
                    
                    $client  = new Client();
                    $url = "https://api.telegram.org/bot" . env("BOTTELEGRAM", "") . "/sendMessage";
                    $data    = $client->request('GET', $url, [
                        'json' => [
                        "chat_id" => env("BOTTELEGRAM_CHATID", ""),
                            "text" => "\n#ugd" .
                                "\nUser : " . $nama .
                                "\n\nMethod : " . $request->method() . "\nURL : " . $request->url() .
                                "\n\nFile : " . $e->getFile() . "\n\nLine : " . $e->getLine() .
                                "\nCode : " . $e->getCode() . "\nMessage : " . $e->getMessage() .
                                "\nWaktu : " . date('d-m-Y H:i:s') . " WITA", "disable_notification" => true
                        ]
                    ]);
                }
            });
        }
    }
}
