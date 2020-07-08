Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77301219272
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 23:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594243255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qG93F05Mf5fWuVc6Ujdqb8P/7P0x4j1aO/gFMsNKSvs=;
	b=dCP54U5OvukDvkUkVu9Uj/PYs1VNBLzZFtFCEm0igY9o8c7AhyupxIQqjWNi+hJoXvKAja
	WuRMB62Ojwa5S03rtTj7qWgdeqC/2zvKgk+heg81QrV9sFvqW4qyTnVw3jDaLb4CCMJ8ia
	2hlTL89iZPwr0qhCbPJk15QnuqETUmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-ugaWSuRMMReWzVBzy6JKew-1; Wed, 08 Jul 2020 17:20:53 -0400
X-MC-Unique: ugaWSuRMMReWzVBzy6JKew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A9801005510;
	Wed,  8 Jul 2020 21:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEDF6FEC0;
	Wed,  8 Jul 2020 21:20:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 596FA1809547;
	Wed,  8 Jul 2020 21:20:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068LKnAd009834 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 17:20:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44D2B2157F25; Wed,  8 Jul 2020 21:20:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A592166BA2
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:20:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B2A81859162
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:20:47 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-NYzqozghOKyYaXGQ0_vecA-1; Wed, 08 Jul 2020 17:20:45 -0400
X-MC-Unique: NYzqozghOKyYaXGQ0_vecA-1
Received: by mail-il1-f199.google.com with SMTP id f66so28212584ilh.6
	for <cluster-devel@redhat.com>; Wed, 08 Jul 2020 14:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qG93F05Mf5fWuVc6Ujdqb8P/7P0x4j1aO/gFMsNKSvs=;
	b=Cmrt148jvCh1u7z0HXUHtQEY2pxiJncMxtpp6FIu105nWAyyOnSS2mzpucamF1nETq
	f4imZc/2G011pnVP5eznmxNX07yQYrxCbK9le5I54+9t3aWrA48LmZ0AYkBMLWXTXHXQ
	zI0sm+g7YbhTdu6wpsqCpSiPvk46HdH5R4pTsy8cCzfe4c+CVuJukgJPs5bbvJIIlxm/
	dqeKUdZtBu/Akc5n3Dp8hqiKxDWtOg8oK+bLhCvekVEpovUGi5kyM3lNXyAawHZ5Cjvq
	jAnYhU/e3mfNFd4Rhg64c/T742vKNuDYw/uVtpImSxDEXJ6ZS+F0LG+uo9bU8KkHIXDW
	KIlg==
X-Gm-Message-State: AOAM533DkmUlN3X4AMIDapXnMUX2rEqiebei4gTbUY1xew3iG/fzC3Sm
	duHFi7966XRoHRLXf/67BzCWl5RHTH40oM3YzdPxI2CtvG3jexp9KFgITCBsfuH62srvfdCD8xA
	7od6ZbZNvj+W4rHcjGD2YDgVB/eulnXvZM0nAyg==
X-Received: by 2002:a92:9ed5:: with SMTP id s82mr44829871ilk.231.1594243244597;
	Wed, 08 Jul 2020 14:20:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbtHD1YOcUBHeLV1rSah+g+JOyFVrvgo2YX3iHXm8IkYuctyTYOULicYru1UcPzJXfdRaBo8W63ciarAW4MiU=
X-Received: by 2002:a92:9ed5:: with SMTP id s82mr44829851ilk.231.1594243244351;
	Wed, 08 Jul 2020 14:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200626164446.114220-1-aahringo@redhat.com>
	<20200626164446.114220-5-aahringo@redhat.com>
In-Reply-To: <20200626164446.114220-5-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 8 Jul 2020 17:20:33 -0400
Message-ID: <CAK-6q+gSh5OGEWM1yYdN67U_aWVjHT83rsRwmR_YE2Uk+dspbw@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCHv2 dlm-tool 4/4] dlm_controld: add
 support for waitplock_recovery switch
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jun 26, 2020 at 12:45 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds support to set the cluster attribute waitplock_recovery
> via enable_waitplock_recover arg or config file attribute.
...
> diff --git a/dlm_controld/main.c b/dlm_controld/main.c
> index b330f88d..3ec318c2 100644
> --- a/dlm_controld/main.c
> +++ b/dlm_controld/main.c
> @@ -1752,6 +1752,11 @@ static void set_opt_defaults(void)
>                         1, NULL,
>                         "enable/disable posix lock support for cluster fs");
>
> +       set_opt_default(enable_waitplock_recovery_ind,
> +                       "enable_waitplock_recovery", '\0', req_arg_bool,
> +                       1, NULL,

that should be 0 otherwise the userland will activate it by default.
The kernel default value is 0.
I will send a v3, sorry about that.

- Alex

