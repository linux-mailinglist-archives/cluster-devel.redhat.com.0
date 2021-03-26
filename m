Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB1F334A8AA
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 14:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616766423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SLktAjfHgFT0G9/i9yrv7Ijbvdc2pUF0T6EjM2XG3Pk=;
	b=fo6cMpFYg6KpZaI76VOrh9KjUVk1EeosYu/rH2nr/+M1SHjdWQGcnChdn/SW5G1zDtt92T
	bKozBSXeGC+pM7Vft6v4iYevn3jjp5LNFaRzcNGVaJszAWZ9fec6itZvlEARVPi+UN9pcA
	ypSEd1+nvnbkudVWEheaanKiMrCJgkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-pS_s5W9FOU2KWmjw-kymTw-1; Fri, 26 Mar 2021 09:47:01 -0400
X-MC-Unique: pS_s5W9FOU2KWmjw-kymTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A26100A661;
	Fri, 26 Mar 2021 13:46:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FC6110013D6;
	Fri, 26 Mar 2021 13:46:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92DDD4BB7C;
	Fri, 26 Mar 2021 13:46:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QDkl88014767 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 09:46:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53A642157F28; Fri, 26 Mar 2021 13:46:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0B72157F26
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 13:46:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE27C802C1C
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 13:46:44 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-512-a69GttYyM4C_ssBzOXyCEw-1; Fri, 26 Mar 2021 09:46:42 -0400
X-MC-Unique: a69GttYyM4C_ssBzOXyCEw-1
Received: by mail-il1-f197.google.com with SMTP id e16so6688061ile.19
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SLktAjfHgFT0G9/i9yrv7Ijbvdc2pUF0T6EjM2XG3Pk=;
	b=I5ofIrl0kFFXp4czt+XJCKP7KOqKNkUowQ0JKpMZHjic1wHVPglpNsC9H+AmJe078s
	mxn1sD6A7vfMyJIHE1WZyOws2uIFHb0LoXjDofd0KeVCPx/1kElfoo5KX+koIGpUaI+j
	gWpcUEtKGB1OyaBFmD7WdjusvkQk1caq1LaxkmQgKwG67dGTaqmDTQZLLGY078QLLIGA
	sMt/eZ1tKDzcreblz4/rSAJ0Vprx+WUoxVNtCT1/xyZvd0JoMs3801zjl7tLP3OVDXY8
	jEVvaEZABHWXTPMshUiDzqT7MnZOXuQltGkKFmnEYrcKL7KBYXAwkr8SkAxAyJhC8QPc
	gYtA==
X-Gm-Message-State: AOAM532mcfX38Prp1LY2+KwuygSqVk/TGgfNcBFC+RBDKIl+TELwS3Zi
	QPkmezHl6Xe28/dS3RNljjqhqk6oVdnxSJM0O2p9BgOQlE/Yao/Fi9Zuc7yoYodm0+3Qz1F8OwR
	GF1JD6efBaSmmztTEj4Hr2K+O6tEQJGHWb2opPw==
X-Received: by 2002:a02:c985:: with SMTP id b5mr12409412jap.86.1616766401338; 
	Fri, 26 Mar 2021 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN4mOYzmc0A9gv+sjdJtNX1PVMT4dmuhh80w3kApu4RaAQixSMEph00niBw88Syd6sTfrxc/5vRaacqnA/MPg=
X-Received: by 2002:a02:c985:: with SMTP id b5mr12409393jap.86.1616766401106; 
	Fri, 26 Mar 2021 06:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210325175828.12708-1-aahringo@redhat.com>
	<5cc2e70b-6166-14fd-b46e-0ba1bb5dd4b4@redhat.com>
In-Reply-To: <5cc2e70b-6166-14fd-b46e-0ba1bb5dd4b4@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Fri, 26 Mar 2021 09:46:30 -0400
Message-ID: <CAK-6q+jstsOToQGJD1xrqCNFvzibzeZY74x59_RF86_xC=41cw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH gfs2-utils] man: gfs2.5: remove barrier
 automatically turned off note
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Mar 26, 2021 at 6:41 AM Andrew Price <anprice@redhat.com> wrote:
>
> On 25/03/2021 17:58, Alexander Aring wrote:
> > This patch removes a note that the barrier option is automatically turned
> > off if the underlaying device doesn't support I/O barriers. So far I
> > understand it's default on, means "barriers" option is applied which
> > should not make any problems if the underlaying device supports something
> > or not. There is by the kernel or gfs2-utils no automatically detection
> > going on which changes this mount option.
>
> Hm, should there be automatic detection? Has there ever been? I'd like
> to get to the bottom of why this language is here before removing it.
>

no idea if there was ever an auto detection or there exists currently
one. I didn't find any auto detection during my research. The related
part came in by: 06b5fb87 ("gfs2: man page updates"). My understanding
is that this option is default "barrier" and you should do "nobarrier"
in cases when you know what you are doing. I even don't know if such
automatic detection is possible, the man-page says "(e.g. its on a
UPS, or it doesn't have a write cache)" in regards to block devices. I
think there is no way in the kernel/user space to check if the block
device is behind a UPS. Maybe there exists some in user space over
hdparm but then things need to be right connected? Regarding cache
handling, you need to know a lot about the used architecture.

I am not sure here as well. I was reading about such automatic
detection and wanted to see how it's done with the result: there is no
auto detection (in gfs2(kernel)/gfs2-utils software)?

- Alex

