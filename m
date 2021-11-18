Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC2455EB4
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Nov 2021 15:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637247212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GSqL33pZvBdxEqOrGuwXW/BKiAVjHUHkTJsYY4Z/nn0=;
	b=WZ0fDb2VVzBI8s12/mJ9XXUwrqgsqEgCHHDI7sHWwm8YwVCRFqdU52M+xeCYXfJxjlOLg7
	p7S52qTZC6XSd9UBhGt7QTwqPBQJ6vpVoGhWR7HoJthLrWMtqZ8w0dUErWfKxtux+ASSst
	7TiRrgPyzGH+5oSpi0DgQhpYQL+MsM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-H7Amxk2UMnaZS0bCsu5SvQ-1; Thu, 18 Nov 2021 09:53:28 -0500
X-MC-Unique: H7Amxk2UMnaZS0bCsu5SvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8704C8799EE;
	Thu, 18 Nov 2021 14:53:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16EF919D9B;
	Thu, 18 Nov 2021 14:53:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7B6F180BAD1;
	Thu, 18 Nov 2021 14:53:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AIErE1d018705 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 09:53:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C99682026D69; Thu, 18 Nov 2021 14:53:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3EF92026D64
	for <cluster-devel@redhat.com>; Thu, 18 Nov 2021 14:53:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDA8A811E81
	for <cluster-devel@redhat.com>; Thu, 18 Nov 2021 14:53:11 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-480-y530DJXmOvKIgmLHyvxCSA-1; Thu, 18 Nov 2021 09:53:08 -0500
X-MC-Unique: y530DJXmOvKIgmLHyvxCSA-1
Received: by mail-qk1-f200.google.com with SMTP id
	w13-20020a05620a0e8d00b0045fad6245e8so5043541qkm.8
	for <cluster-devel@redhat.com>; Thu, 18 Nov 2021 06:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ktZwmNj2i6HRghsgzsPdqkJk4QpYNvRhiEpD3DouXpc=;
	b=ByXeriLCO75gih8jYxJaMZcTmm56KerRikiIRy53VvP510mL7v1vWkDoAePT6krXAl
	xvdZqgKxgsl7BTHzm7uOEqTnYqj8hwvBeRyM6X/kZ3aukEgpjnIIsoRbGhlr/Sb0EvHA
	F3oPhPxHPlXvIOvls+lI51+okDgqkmgPoC0pKK+UFex71zoBC6/hGo77Qa4J/4XCJAg5
	2kjPW01ofAR+oeBrxoxTHH868wzLFZwxG1cPRwijwl3YBX3NuVRYueCa0BvMXf8QAUid
	zoaq0bvqZdLvR8xDxIXscXgXW8NVodARrH5kfEVNbj9Z7Ru4OQDugF8sP6g3+LTdpiQb
	dYqg==
X-Gm-Message-State: AOAM533kAq7WgELg5YfTHpxXpV+gvF37ilBgT7nfGPs9nmx4lFDlSckE
	0c5NLXYTv9n8qw1wzqHUT7CuNZLDzblMjXDQFrbDB9EXCo/pPwvtCaKqjqGlaJh6TSOd/l1L0lx
	RtqD1Q+NlqUUBX3HFUgXH5JhPIR5sfkWAQk2nGA==
X-Received: by 2002:a05:620a:2403:: with SMTP id
	d3mr21281683qkn.281.1637247188136; 
	Thu, 18 Nov 2021 06:53:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSc+hBdpB8rrN3UkT8yniJtEKjtj0Ij4dD3He2By/RfQJkikWJixdi13MzE6tEqilPyDs+LXKP7bNIxMaR/4o=
X-Received: by 2002:a05:620a:2403:: with SMTP id
	d3mr21281669qkn.281.1637247187998; 
	Thu, 18 Nov 2021 06:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20211118082355.983825-1-geert@linux-m68k.org>
In-Reply-To: <20211118082355.983825-1-geert@linux-m68k.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 18 Nov 2021 09:52:57 -0500
Message-ID: <CAK-6q+gQCzJeV5VbCJUbg1dt=4nPvgBAOP5cPmLchmnro1pQ_A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AIErE1d018705
X-loop: cluster-devel@redhat.com
Cc: Network Development <netdev@vger.kernel.org>,
	"Reported-by : Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] fs: dlm: Protect IPV6 field access by
	CONFIG_IPV6
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, Nov 18, 2021 at 3:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> If CONFIG_IPV6=n:
>
>     In file included from fs/dlm/lowcomms.c:46:
>     fs/dlm/lowcomms.c: In function ‘lowcomms_error_report’:
>     ./include/net/sock.h:386:34: error: ‘struct sock_common’ has no member named ‘skc_v6_daddr’; did you mean ‘skc_daddr’?
>       386 | #define sk_v6_daddr  __sk_common.skc_v6_daddr
>           |                                  ^~~~~~~~~~~~
>     ./include/linux/printk.h:422:19: note: in expansion of macro ‘sk_v6_daddr’
>       422 |   _p_func(_fmt, ##__VA_ARGS__);    \
>           |                   ^~~~~~~~~~~
>     ./include/linux/printk.h:450:26: note: in expansion of macro ‘printk_index_wrap’
>       450 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>           |                          ^~~~~~~~~~~~~~~~~
>     ./include/linux/printk.h:644:3: note: in expansion of macro ‘printk’
>       644 |   printk(fmt, ##__VA_ARGS__);    \
>           |   ^~~~~~
>     fs/dlm/lowcomms.c:612:3: note: in expansion of macro ‘printk_ratelimited’
>       612 |   printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
>           |   ^~~~~~~~~~~~~~~~~~
>
> Fix this by protecting the code that accesses IPV6-only fields by a
> check for CONFIG_IPV6.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 4c3d90570bcc2b33 ("fs: dlm: don't call kernel_getpeername() in error_report()")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Thanks, but the issue has already been fixed in the same way [0].

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/commit/?h=next&id=1b9beda83e27a0c2cd75d1cb743c297c7b36c844


