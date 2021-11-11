Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A627D44DA46
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Nov 2021 17:21:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-LvF0ZqnBN-aJg1S7POfrrA-1; Thu, 11 Nov 2021 11:21:33 -0500
X-MC-Unique: LvF0ZqnBN-aJg1S7POfrrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01A25A40C1;
	Thu, 11 Nov 2021 16:21:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70095DEFB;
	Thu, 11 Nov 2021 16:21:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A7034E58F;
	Thu, 11 Nov 2021 16:21:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABGLQQP012660 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 11:21:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9BAF51121318; Thu, 11 Nov 2021 16:21:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97AEA1121314
	for <cluster-devel@redhat.com>; Thu, 11 Nov 2021 16:21:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF617185A7B2
	for <cluster-devel@redhat.com>; Thu, 11 Nov 2021 16:21:23 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-59-TSjOEQ_xOHuPbhG5xL8sYQ-1; Thu, 11 Nov 2021 11:21:22 -0500
X-MC-Unique: TSjOEQ_xOHuPbhG5xL8sYQ-1
Received: by mail-io1-f54.google.com with SMTP id x10so7590054ioj.9;
	Thu, 11 Nov 2021 08:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hBm6JO/iSJ+GL1C6xVW5PCmaMsD9ZfQqODjs2YkP1sU=;
	b=aTvf2D/EtJkCCMcIMQXofixJ2ScIIQVMMrA5UcTxV8v6T0LLgkqrI84qVvPdsuHyg7
	XyYACytMFuAK0KOK/JYpFvaT5DlsN6nWiDXrCo7gkgjHZtymIFokHQvC6ZDWxhI+Uab/
	R0qk8CeK+HYPbWQ+hUkVxOixQIu4bAdsTp7i4ndMphPUyyN287eamuuhD62LFIRdmbaG
	GII+ao5TOQ2H6plzQU/83nbv/FO6lVd49pab5PoiYtq+O82l3hJBfAPCkzRtk6O1ac/g
	hUjlFQJ7T8MuxV1F7gtCTH+XJPf0AWRJnef81HMeni+jWb2ApQLXZ3raO5hoNv6YOX1l
	HOJw==
X-Gm-Message-State: AOAM530cAB22ncYu7RqY5JB56n6uQOkzWBVQQ4N7XWALB9zMhl+gZRII
	r9qVVcJT/y5Wnv5DFiqbfE0j2sd14G1oTTo8xeqDgXHE
X-Google-Smtp-Source: ABdhPJxkBdvyWNsHljIwNTdiGRWG08lJpu3tGVUukky9muJYg0YaC5jYHTIk/gC7oo7gaQB5/SOPVDm2YXZLXvzSMe8=
X-Received: by 2002:a05:6602:45d:: with SMTP id
	e29mr5752619iov.202.1636647681387; 
	Thu, 11 Nov 2021 08:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20211110113842.517426-1-agruenba@redhat.com>
	<20211110125527.GA25465@lst.de>
	<CAHc6FU49TnYvrL-FU5oz9th6STuQ=eYokjsD+0QpbkdHedRd9w@mail.gmail.com>
	<20211111072506.GB30478@lst.de>
In-Reply-To: <20211111072506.GB30478@lst.de>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Thu, 11 Nov 2021 17:21:10 +0100
Message-ID: <CAHpGcM+GVufLn_VZD_Kmrj=Y-XQwkqcjFxN4aFajh1Loi324ow@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
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
Cc: cluster-devel <cluster-devel@redhat.com>,
	"Darrick J . Wong" <djwong@kernel.org>, stable <stable@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [5.15 REGRESSION] iomap: Fix inline extent
	handling in iomap_readpage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Do., 11. Nov. 2021 um 08:26 Uhr schrieb Christoph Hellwig <hch@lst.de>:
> The iomap mapping sizes are read-only to iomap for a good reason.  You
> can't just break that design.

Right. We can stop iomap_iter by returning 0 now though; see v2.

Thanks,
Andreas

