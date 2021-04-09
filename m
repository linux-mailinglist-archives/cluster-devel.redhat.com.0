Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C42D43597FA
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 10:35:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-CXfU3PdtMO2vwI4mS5CKGg-1; Fri, 09 Apr 2021 04:35:07 -0400
X-MC-Unique: CXfU3PdtMO2vwI4mS5CKGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C139107ACF7;
	Fri,  9 Apr 2021 08:35:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85B8219C66;
	Fri,  9 Apr 2021 08:35:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 501FD1806D0F;
	Fri,  9 Apr 2021 08:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1398YrkL012265 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 04:34:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89A4E2172940; Fri,  9 Apr 2021 08:34:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C6B217295D
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 08:34:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C977280231D
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 08:34:50 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-433-1kboS2SzMhqzcZ8g9vB-Nw-1; Fri, 09 Apr 2021 04:34:46 -0400
X-MC-Unique: 1kboS2SzMhqzcZ8g9vB-Nw-1
Received: by mail-il1-f178.google.com with SMTP id x12so1226069ilm.2;
	Fri, 09 Apr 2021 01:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NCwJI5ffEAzMKRWH7+S+TuRytYmua5VwVLYnvYOAOL8=;
	b=SfLP6Urm2Wx3dlBjOxvqRwOsS/4HSF3QswwIPiQJmJBPgwaUSR7w7lLP7ms3oYRVuN
	P9fdmXdxbnQ8aor7G2LQjrE1TL1ACiBO646H70wOFdkNxKjDZA3jDHMz9nuca4mMFw2U
	JKck04XAr28ohZvPZ56DtEPLWGV3Q8K6phCLeuRHZZeDbF/Un3vYzl3BDx9jwSn1Z1UO
	1GfG6Xzeo56j5XadCIKf0LiO8utMv6w7qjKxvbPGkn6wdrbtXvXmv3DjoAk4SrFbokRL
	YbwVVMdztWKG1Qs6S3cFHFBJyNl7nAxa4NyUbhQDPw6mhpuQFei++3KsGUuorxCZS7zC
	57Uw==
X-Gm-Message-State: AOAM533+cZRUjUgUJ4FEjDqwhVAuw/RaJkP4q0Wx8PA0fSMlXB49qgU3
	OYwnQK9gOt4lipMRncqnSXg4WtgeeCdIpu3h448=
X-Google-Smtp-Source: ABdhPJy8Go9eGKnxjqs+H5oCYvcs+FPgMqWv4m1tQrwU/f3ose04FlweQI1nD/xWG1T8+OZ7INEY9e3s45xNKoTSP9s=
X-Received: by 2002:a92:dd12:: with SMTP id n18mr10698284ilm.109.1617957285922;
	Fri, 09 Apr 2021 01:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210409082957.2909213-1-weiyongjun1@huawei.com>
In-Reply-To: <20210409082957.2909213-1-weiyongjun1@huawei.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 9 Apr 2021 10:34:34 +0200
Message-ID: <CAHpGcMJdBD9XDJvzy2_9EuKaduSewd0p+39B1przV7UW3rtouA@mail.gmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, Hulk Robot <hulkci@huawei.com>
Subject: Re: [Cluster-devel] [PATCH -next] gfs2: use kmem_cache_free()
	instead of kfree()
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

Hi,

Am Fr., 9. Apr. 2021 um 10:20 Uhr schrieb Wei Yongjun <weiyongjun1@huawei.com>:
> memory allocated by kmem_cache_alloc() should be freed using
> kmem_cache_free(), not kfree().

thanks for the patch, that's true. This patch has turned out to have
other problems as well, so we've pulled it and Bob is currently
investigating.

Andreas

