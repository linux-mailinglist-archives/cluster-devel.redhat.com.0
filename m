Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EDE313E99C3
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 22:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628714218;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sNzokimTfZvC4/sCl6S7Tls8sZhPp93q4HrEKvxSKwM=;
	b=WIXlPL/HUZ4p0Tsm8Ej3K1zlAoBH/UOLYHCqzM408vMPNM+GWrxSqyUnWM1FlsGqsyNpje
	tkaEYK9Kxx12CBunX6RXhpLReo8bcN6yLbydDiaFBkcLApkInyNZ3fsjIlMrU9NJSQ891r
	Yq9ojTkUYMFEBOmwmMDMK9y/+kBYbgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-6usF06BwPXWxYqLuQRkCJg-1; Wed, 11 Aug 2021 16:36:57 -0400
X-MC-Unique: 6usF06BwPXWxYqLuQRkCJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61D491082920;
	Wed, 11 Aug 2021 20:36:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EAEC10016FF;
	Wed, 11 Aug 2021 20:36:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7820D181A3E9;
	Wed, 11 Aug 2021 20:36:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17BKZXof019841 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 16:35:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1B652028685; Wed, 11 Aug 2021 20:35:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0072028758
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 20:35:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17BD0101A52C
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 20:35:30 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-294-00j4i7p-Nc6hR2Wj-Yot4Q-1; Wed, 11 Aug 2021 16:35:28 -0400
X-MC-Unique: 00j4i7p-Nc6hR2Wj-Yot4Q-1
Received: by mail-qk1-f197.google.com with SMTP id
	b16-20020a05620a0890b02903d22e8fed30so2088036qka.23
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 13:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sNzokimTfZvC4/sCl6S7Tls8sZhPp93q4HrEKvxSKwM=;
	b=lMIpWHPI74Eyru3PEqIYcA/ILquwQehMAOVZumct4/Tf6+njyq7u3q9QxWFg99weOe
	b/XBp84fDy6PHyvqIRwrIjNFIPs8/Klhx2unT1jqh3u+nQXRAjr6iQQ6a4wvT1ITCyAf
	masZmgh4GwLrByV0brIfbO6d324NLg8HO1TFIJKQwyN4Q0+KEC7ms4qykVQFIp0gQFjP
	4bUHC8zjr3vJH09Omx/UoGtDc0AguEG8olwTh92TNASOsZlDaqteuAGmireA+qkJL2U+
	/xPysqUIsp1yYWOYsbMkFuKy+oqqPwfaRHxCTQ2us4FTjYNYZFe7jZuRsgfBR23weLIM
	yasw==
X-Gm-Message-State: AOAM532IJr6I2Cm5s+i7Z+uHv141k7ytq9+DEHolUTcpMgFKR6PcStlg
	o0mXOsMJGrVbuBExmfJn//G07LpDO96SHeJvYZfTOAeJnmgHzDnzWNpYTlOQrj146+pr6lLADvX
	mg9GOxkaSdrxXeMzC4kG4SoCd6xLQtd27hbD5WQ==
X-Received: by 2002:ad4:51c7:: with SMTP id p7mr459733qvq.15.1628714128044;
	Wed, 11 Aug 2021 13:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr3DMHFrUGkf091xcEGpu9LnaJ2QP8bbPX7YbhuEXAY3izdjr2jBrY2uJxyQMETxLywhCdAMtNP7C4xHfDbCw=
X-Received: by 2002:ad4:51c7:: with SMTP id p7mr459723qvq.15.1628714127917;
	Wed, 11 Aug 2021 13:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 11 Aug 2021 16:35:16 -0400
Message-ID: <CAK-6q+hXb=hBHHgS94M94aS7JCeCuUrwVH=05oJoxt3tFatDyw@mail.gmail.com>
To: Gang He <GHe@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Why does dlm_lock function fails when
 downconvert a dlm lock?
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

On Wed, Aug 11, 2021 at 6:41 AM Gang He <GHe@suse.com> wrote:
>
> Hello List,
>
> I am using kernel 5.13.4 (some old version kernels have the same problem).
> When node A acquired a dlm (EX) lock, node B tried to get the dlm lock, node A got a BAST message,
> then node A downcoverted the dlm lock to NL, dlm_lock function failed with the error -16.
> The function failure did not always happen, but in some case, I could encounter this failure.
> Why does dlm_lock function fails when downconvert a dlm lock? there are any documents for describe these error cases?
> If the code ignores dlm_lock return error from node A, node B will not get the dlm lock permanently.
> How should we handle such situation? call dlm_lock function to downconvert the dlm lock again?

What is your dlm user? Is it kernel (e.g. gfs2/ocfs2/md) or user (libdlm)?

I believe you are running into case [0]. Can you provide the
corresponding log_debug() message? It's necessary to insert
"log_debug=1" in your dlm.conf and it will be reported on KERN_DEBUG
in your kernel log then.

Thanks.

- Alex

[0] https://elixir.bootlin.com/linux/v5.14-rc5/source/fs/dlm/lock.c#L2886

