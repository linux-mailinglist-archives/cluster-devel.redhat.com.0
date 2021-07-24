Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1533E3D462D
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 09:51:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-89_O3avNOFOORyK2q0C69Q-1; Sat, 24 Jul 2021 03:51:56 -0400
X-MC-Unique: 89_O3avNOFOORyK2q0C69Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E6E8042E2;
	Sat, 24 Jul 2021 07:51:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C01171970E;
	Sat, 24 Jul 2021 07:51:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D904180BAB1;
	Sat, 24 Jul 2021 07:51:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16O7pjGj014960 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 03:51:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60A612051B6C; Sat, 24 Jul 2021 07:51:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C57F200ACF5
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 07:51:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69FDE858287
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 07:51:42 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-487-mr_-fKZKONmPMdP1CVUG6w-1; Sat, 24 Jul 2021 03:51:38 -0400
X-MC-Unique: mr_-fKZKONmPMdP1CVUG6w-1
Received: by mail-io1-f46.google.com with SMTP id l126so5225875ioa.12;
	Sat, 24 Jul 2021 00:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y2QQPVpY5Yk4Ahbva/fAslyPabEv5/WNks/0wpOIAes=;
	b=OhyJiJNiSpERI5Wy//JahwIvw2iuXQno2O/mLW8GFYaCE3iQsULakmkoOLlg74kWeZ
	1M/0KGqV/X/xXnHQ89yCT5O/hfbp4UGHPWQfqG4xV43z5tIV5GtxkY7ruYGRo8zXXNo1
	OyA/YDI7aCso1c4fm4d9QorkyBfft1Y2ossCcCUOLKQFsh4zo+hl91YSjbZIUtpHHW1q
	vyNTOxJA5c9JJKVpFd7Ncyuh9G7h2tHNpF0pHwru952/v5ooay1hVns49KWz3Me8GOEK
	BoFhFZtEuazlwbvUVqomn9FBnOquCZT2RZk6lCzRU777o+1qnhesA4L99UEF8Cf/AWXJ
	uKFw==
X-Gm-Message-State: AOAM531SXoPS/EcCCBIVgYwwgOINFtxPTAneePILY2n9yvGdc7DRrwsa
	AMv+Sey/Po0rFrgIBzBnoipT/uItEmdCKA1qRRE5fXSQ4Jg=
X-Google-Smtp-Source: ABdhPJzDdEnxvONgCmtty5Tezj88xyF1uFQQzt9Gfef9fX5MDhIGXPXu7+QsRQ7ua/GZtyyXWjULBqOJosu+Nt5XcBM=
X-Received: by 2002:a02:85a5:: with SMTP id d34mr7400013jai.132.1627113097425; 
	Sat, 24 Jul 2021 00:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-2-agruenba@redhat.com>
	<CAHk-=wg1n8yVeKABgfx7itM5o1jXVx6WXRF5PxHx+uqeFBmsmQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg1n8yVeKABgfx7itM5o1jXVx6WXRF5PxHx+uqeFBmsmQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Sat, 24 Jul 2021 09:51:26 +0200
Message-ID: <CAHpGcMK7mT+QuDJZ-Aqq+gWgT2HZUkD_JkVgabEyOR1gOebUjA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
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
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 1/7] iov_iter: Introduce
	fault_in_iov_iter helper
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

Am Sa., 24. Juli 2021 um 01:41 Uhr schrieb Linus Torvalds
<torvalds@linux-foundation.org>:
> On Fri, Jul 23, 2021 at 1:58 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Introduce a new fault_in_iov_iter helper for manually faulting in an iterator.
> > Other than fault_in_pages_writeable(), this function is non-destructive.
>
> Again, as I pointed out in the previous version, "Other than" is not
> sensible language.

Thanks for pointing this out a second time. I have no idea how I
screwed up fixing that.

Andreas

