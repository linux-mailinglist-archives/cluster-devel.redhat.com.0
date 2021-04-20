Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA7366113
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Apr 2021 22:43:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-ZUKS-BWaO5GSvZ4krMIZCw-1; Tue, 20 Apr 2021 16:43:06 -0400
X-MC-Unique: ZUKS-BWaO5GSvZ4krMIZCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5A8192203A;
	Tue, 20 Apr 2021 20:43:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99DD95B4A6;
	Tue, 20 Apr 2021 20:43:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B172C1806D16;
	Tue, 20 Apr 2021 20:43:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13KKeVja009463 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 16:40:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3CC8210F8E23; Tue, 20 Apr 2021 20:40:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F8A10085CD
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 20:40:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0492F104D9A1
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 20:40:28 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-269-8BqKZE5-N9ml6I9GR8fBoQ-1; Tue, 20 Apr 2021 16:40:23 -0400
X-MC-Unique: 8BqKZE5-N9ml6I9GR8fBoQ-1
Received: by mail-il1-f173.google.com with SMTP id c18so33115187iln.7;
	Tue, 20 Apr 2021 13:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kry+U86OyspoO4d2pLMc68TiRp5ZV9OLSFUVCrELgSU=;
	b=sPpq4ljQAkM7w1az9hv7pDsmyU/E3o4fTxY5/wPKR+NNBNYZsfz6sUvJUljDGceC0t
	RFHFjG31RMh0nXG9qRQp4wWDURZ2Cvy56BEnrTYAVW7yhyYho8W6wv0NchzXJ7GvQn3w
	UEwA7quksi3dxkF1k/z60Uql+vV5v320tXbZW91ruMLt59GIF/ADwWXGiRDvUwxKAv6t
	/SVRVUgFdFcfAIm/aC5jYmQSjaDJ6UKhn/1lfcXZqIQ3iMjP6spv1x7hV83TBWGa8HW0
	bvDK/yKaGKFhvqm8inlJ1cmlvWLerFLh0jPXCWJDfSZP8+tbtTv8I84GCOo6Dpo7jNTo
	HQ7g==
X-Gm-Message-State: AOAM530wMraRaICX1xeOjyeOdjIW7TSSczJUBMImilZFKaRO0HsYpOSS
	fzt2QjNrv+SFZsS0Tf7Sy5Afu+4LbbSe87nwWkUkVYGW
X-Google-Smtp-Source: ABdhPJwGjq+vOzjCw4CMNmbVY9D9Ly31mSZioAiKDoC+oHgxFpI2lcukUnc//qdkpnI6dVWmYArAPy+8wghI9SLOozM=
X-Received: by 2002:a92:1910:: with SMTP id 16mr22995124ilz.201.1618951223190; 
	Tue, 20 Apr 2021 13:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
	<84d07c8510abf95c9e656454961c09b14485b856.1605896059.git.gustavoars@kernel.org>
	<5adf738a-315b-a80e-46ff-06822441a789@embeddedor.com>
In-Reply-To: <5adf738a-315b-a80e-46ff-06822441a789@embeddedor.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 20 Apr 2021 22:40:11 +0200
Message-ID: <CAHpGcM+FKd9PPcW-X-FzkOmp62RgNzqZYbkMUPahabFO3ETKaw@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, linux-hardening@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 006/141] gfs2: Fix fall-through warnings
	for Clang
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Di., 20. Apr. 2021 um 22:29 Uhr schrieb Gustavo A. R. Silva
<gustavo@embeddedor.com>:
> Friendly ping: who can take this, please?

Oops, that got lost. I've added it to for-next now.

Thanks,
Andreas

