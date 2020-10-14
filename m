Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C6A6B28E13F
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 15:25:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-CvV_uDcKNmiKd0ARZLwl8w-1; Wed, 14 Oct 2020 09:25:54 -0400
X-MC-Unique: CvV_uDcKNmiKd0ARZLwl8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 857D264089;
	Wed, 14 Oct 2020 13:25:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C25EA5D9D5;
	Wed, 14 Oct 2020 13:25:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9722181A06B;
	Wed, 14 Oct 2020 13:25:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EDPi70001113 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 09:25:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1F312157F24; Wed, 14 Oct 2020 13:25:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD5402166B27
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 13:25:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8303811E8F
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 13:25:42 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-53-mk4_7oUdPc6L2rwdCjmqmw-1; Wed, 14 Oct 2020 09:25:37 -0400
X-MC-Unique: mk4_7oUdPc6L2rwdCjmqmw-1
Received: by mail-lf1-f65.google.com with SMTP id h6so3693812lfj.3;
	Wed, 14 Oct 2020 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mKFq6iwfvEkroibpmULLRLiQ1H931GZCc/Lu/Ysbxus=;
	b=VYxI/K0d/2Olh+ZycdLrrK4NTreSdignw2HM0Gcnyxkcsfj8HzHFEXg9SfWviLcr//
	GwwshkLJ5pNG/EO7xqpSMCmEWUHn4M/BzcJR2MyZpL6X650uV18f7M9z9mXunI4W9ODt
	iYTmipgKgQ/McVc/w5lDwgq4ErtLCWK4q9sGX589cXhXWa2RTsjX+BPoXzwUChpKrcbJ
	WKmWWcj0Os/bIYkTbOAxNmp+P9r9a9VBTQeSXecWPlBRKHfMrYoHPCJc89KRyppwGbe6
	b+omw9UAQ7v5nQa2w6oUb/+iN2d1ESCd1xvZ+3oL9F+6f3z5wND8Vk00a/uRMn2S5lOy
	s2Ew==
X-Gm-Message-State: AOAM531Dfwn3ncNYrHn966qaN/tb8Sdy1DIIpYZyMvQ0ihY2FMV1eTGz
	20ftdJhGcUGY9WVmUGvLrJo0SdR1KwsIorVIpoLLKD99IY2UtGhnwYY=
X-Google-Smtp-Source: ABdhPJwulrqs2A1OwJl/ciD0ZDmCvYFr1xNNHp0xX0kyXd17jU0DVKvM+U1lUNcFP/8HGFI3MD3JXtZv7707iMXArNI=
X-Received: by 2002:a19:40ca:: with SMTP id n193mr1250337lfa.96.1602681935224; 
	Wed, 14 Oct 2020 06:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
	<d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
In-Reply-To: <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 21:25:24 +0800
Message-ID: <CAC2o3DJ1qBO+dhFVgGk_u5X2K0_G-pxQVjT32z=dsPL=4jr1_w@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
	linux-kernel@vger.kernel.org,
	syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
	cluster-devel@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: prevent OOB access in
	gfs2_read_sb()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, Oct 14, 2020 at 9:04 PM Andrew Price <anprice@redhat.com> wrote:
> Just a heads-up to avoid duplication of effort: Fox Chen (CCed) has
> attempted to fix this also[1], but I don't know if they plan to send
> another patch.

Oh, I thought it was solved by someone else as you've pointed out the
correct solution the other day. https://lkml.org/lkml/2020/10/5/538

I'm solving another bug right now, I will leave this to Anant. :)


thanks,
fox

