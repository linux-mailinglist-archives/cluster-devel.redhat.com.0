Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 79B323B9862
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jul 2021 23:58:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-N8-z_lYlMMeoE3w771hUag-1; Thu, 01 Jul 2021 17:58:08 -0400
X-MC-Unique: N8-z_lYlMMeoE3w771hUag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A411030C22;
	Thu,  1 Jul 2021 21:58:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D7755D6D3;
	Thu,  1 Jul 2021 21:58:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D698F1809C98;
	Thu,  1 Jul 2021 21:58:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 161LqYhY014868 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 17:52:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C615A20B8DB5; Thu,  1 Jul 2021 21:52:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C24B520B8DA8
	for <cluster-devel@redhat.com>; Thu,  1 Jul 2021 21:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 399658A3D23
	for <cluster-devel@redhat.com>; Thu,  1 Jul 2021 21:52:32 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-584-SF9edMBMMfah4NBUGXKHCg-1; Thu, 01 Jul 2021 17:52:30 -0400
X-MC-Unique: SF9edMBMMfah4NBUGXKHCg-1
Received: by mail-lf1-f48.google.com with SMTP id a15so14435195lfr.6
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 14:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J39z1K1H9iYgiKTRenHzC+Q5MRshLFfVFTh3xPa3JgM=;
	b=IIMuKAMKwch7wyjkwKKAzn+u+cNzPpd2C1YBmfO/zj/rn14sBcyJgEcu+iIF2HlBed
	8wmAIZHKqllRaoXxFurf20HXlCyST8NDZuo/coDWbUTGFzRbm6obE39mMpgKf6BONAEY
	RGw5xsYK1b3D4tTE/S4Et2qh0esNXNkFH/0jm8VqrQvjoSByeCpdDXyEwBGWy2qa1BFN
	Tu5hQXMPJzYSZFMsTIqzGbljCO7XKxWW1Qi6fpO7fVEm33vEOahiit/RPCo8EvSaQjmn
	N42j8uQNNfjl12Bcq9yDSB2E2IYePhLlDCVRuWUHMck98ToEplRekdVI3fU5dKciI+w7
	nQug==
X-Gm-Message-State: AOAM5336tzoXOJiTfM30xyV8eAZfm9aK3nz/HqnnXmWtRHRymJmNPb2x
	y9upY5bNKQ9EtXZJRTgrgvBP0eGE66gQaUkSkEo=
X-Google-Smtp-Source: ABdhPJwhsA+6HEYKhbPdVNKIlG/FX4bGZwKXjvc2tQw3jjbbYCpHrbfjqnVqw6zJFK/8UIDMWXcgYw==
X-Received: by 2002:a05:6512:1303:: with SMTP id
	x3mr1271900lfu.276.1625176348727; 
	Thu, 01 Jul 2021 14:52:28 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
	[209.85.167.49])
	by smtp.gmail.com with ESMTPSA id y16sm82326lfe.213.2021.07.01.14.52.27
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 01 Jul 2021 14:52:27 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id f30so14478643lfj.1
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 14:52:27 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr1222289lfc.201.1625176347073; 
	Thu, 01 Jul 2021 14:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210701204246.2037142-1-agruenba@redhat.com>
	<CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
In-Reply-To: <CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Jul 2021 14:52:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whHTB6dOrz3AkPVL7h5t8k0Ety1dy1r+BEy3+xptzF3bQ@mail.gmail.com>
Message-ID: <CAHk-=whHTB6dOrz3AkPVL7h5t8k0Ety1dy1r+BEy3+xptzF3bQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix mmap + page fault deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 2:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So what the direct-IO code _should_ do is to turn an ITER_IOVEC into a
> ITER_KVEC by doing the page lookup ahead of time

Actually, an ITER_BVEC, not ITER_KVEC. It wants a page array, not a
kernel pointer array.

But I hope people understood what I meant..

             Linus

