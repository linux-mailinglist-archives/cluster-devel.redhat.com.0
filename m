Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A77653F2E66
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 16:49:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-qLJ0y-beNEuBbbUsCXKXtA-1; Fri, 20 Aug 2021 10:48:35 -0400
X-MC-Unique: qLJ0y-beNEuBbbUsCXKXtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958EC801A92;
	Fri, 20 Aug 2021 14:48:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 648961A26A;
	Fri, 20 Aug 2021 14:48:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D5534A7C8;
	Fri, 20 Aug 2021 14:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KEhuGZ025194 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 10:43:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 898D4116725; Fri, 20 Aug 2021 14:43:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC37116724
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 14:43:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E7918A01AB
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 14:43:52 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-3dbX12ezPJO_DVDuk5UKug-1; Fri, 20 Aug 2021 10:43:48 -0400
X-MC-Unique: 3dbX12ezPJO_DVDuk5UKug-1
Received: by mail-io1-f51.google.com with SMTP id f6so5021509iox.0;
	Fri, 20 Aug 2021 07:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zWMM/5S4dFOu/WD5ECEAYdeBKl4z45VntP0JWXoYfUw=;
	b=C4rjwruoF1yObWZdtNpoRDwAnHgDcJHkOw+dyslHrdluvpYHbSE5HmHNu2WGC2Gk2w
	utMcb5t/GC3jlgCbuix53KvVxKoafqjNNnh4KCR1zAtrmML0x7zFqWh7EzOALjh8tDUA
	XRb+0qaoe/iNtWEdP1grDquNubmUl1aPr6wcaDJtSWG6/rJHP2Vnl9ilNir5Uiis3WPA
	7dwanNDZskret3dbaFMHSKG+ctcmzm6unZdRJiMj1R5/+GuYT55gDvV3z5Ek91tVZiSX
	EJpOfDa14TmHS7cMHT/1ppn4HTeQpOFQzEfeZyjDWOxfH/NRDMUDXLWtPI+cUyWoSVOP
	Pwyg==
X-Gm-Message-State: AOAM530s0Qx6qlq5ecTrDP3AR5tsqRLLFkwl+NmnYDF88TrY6IuQAbdB
	ElwzeVndcn84Qi8lVySH9PPqoLZOdTKLXT75tRpPgk+cpNo=
X-Google-Smtp-Source: ABdhPJzOk9dUXsN4s4KGdaDemx/wIgj5uCLKt6CfKvzXNaaMS+7QqZjwN6w29MmItaj9l67c72f3RtIl+DIu84YdWEM=
X-Received: by 2002:a02:7a15:: with SMTP id a21mr14609694jac.128.1629470627371;
	Fri, 20 Aug 2021 07:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<CAHc6FU7jz9z9FEu3gY0S2A2Rv6cQJzp7p_5NOnU3b8Zpz+QsVg@mail.gmail.com>
	<d5fbfeff64cee4a2045e4e53abbd205618888044.camel@redhat.com>
In-Reply-To: <d5fbfeff64cee4a2045e4e53abbd205618888044.camel@redhat.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 20 Aug 2021 16:43:34 +0200
Message-ID: <CAHpGcMJTPfJ3M8SjMgv88xkbJLy8mhXTGEkWy8WjXM0NBcsZ1A@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] gfs2: Introduce flag for glock
 holder auto-demotion
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

Am Fr., 20. Aug. 2021 um 15:49 Uhr schrieb Steven Whitehouse
<swhiteho@redhat.com>:
> We always used to manage to avoid holding fs locks when copying to/from userspace
> to avoid these complications.

I realize the intent, but that goal has never actually been achieved.
Direct I/O has *always* been calling get_user_pages() while holding
the inode glock in deferred mode.

The situation is slightly different for buffered I/O, but we have the
same problem there at least since switching to iomap. (And it's a
fundamental property of iomap that we want to hold the inode glock
across multi-page mappings, not an implementation deficit.)

Here's a slightly outdated version of a test case that makes all
versions of gfs2 prior to this patch queue unhappy:
https://lore.kernel.org/fstests/20210531152604.240462-1-agruenba@redhat.com/

Thanks,
Andreas

