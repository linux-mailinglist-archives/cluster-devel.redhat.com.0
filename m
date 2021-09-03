Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2988B4002A6
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 17:52:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-WGNKgHqhNE-9rr0xHAyVZA-1; Fri, 03 Sep 2021 11:52:33 -0400
X-MC-Unique: WGNKgHqhNE-9rr0xHAyVZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF0D801ADA;
	Fri,  3 Sep 2021 15:52:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB4C718A6A;
	Fri,  3 Sep 2021 15:52:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 271F61809C81;
	Fri,  3 Sep 2021 15:52:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183FqRR1003217 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 11:52:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A97810EB1; Fri,  3 Sep 2021 15:52:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F10111F6
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 15:52:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EACA8564EC
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 15:52:24 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-Pmnw6VCrOKyfxyYLIX9yUw-1; Fri, 03 Sep 2021 11:52:20 -0400
X-MC-Unique: Pmnw6VCrOKyfxyYLIX9yUw-1
Received: by mail-lf1-f48.google.com with SMTP id c8so12630389lfi.3
	for <cluster-devel@redhat.com>; Fri, 03 Sep 2021 08:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kr5rIfOe6Hwe2+y+jDes91fVUZ+f9S7J89384UtJgA8=;
	b=rvSy408TjbXJbophKtfvsoSVu7ZVtDWD5z4hgaxsmM2G0F4o97HXpf/ZZFaytsG5Am
	KU+3uYd2VREQEsVopBQ8QfqHr8MfglXqFerg5rti0WyZm62o0HM0ujRUSR8B1rZ71aSb
	QdVECZJyMFdkDbNsCcSzxJTsLS7+Af83+3kEyroHIWtqb2oA2AGMced+4NbThOMx9Ngi
	wGZVjul1N0eKCv8wb2+h1aWRI685bj7QXe9hDf4HvBtY4YUs0Nq4pPE2K6DHQMJ6fziI
	sQPt/v1VA6nSYHxjye7O9OSmqKu6zNLDBaq/hbo+j5eGExS/BhwuzVRg+CGnHPzHmSt6
	s8CA==
X-Gm-Message-State: AOAM533QEIQJby8pSt94wNXK+KauzQroN+YtMhu4b6IsXnqVeNNdcoBv
	RJk6rVdGva/iUiLQqkxL2f9fgTdTTgIzkN8GY9w=
X-Google-Smtp-Source: ABdhPJyVM23gjn00UAx74zdMmlYsTrSvBxNC++Kt4PaJJVefw5Glr6hKd2Xj7WtteeiHMvcKB2OSIg==
X-Received: by 2002:a19:e202:: with SMTP id z2mr3158928lfg.376.1630684338990; 
	Fri, 03 Sep 2021 08:52:18 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46]) by smtp.gmail.com with ESMTPSA id
	u17sm558180ljk.124.2021.09.03.08.52.16 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 03 Sep 2021 08:52:17 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id p38so12713755lfa.0
	for <cluster-devel@redhat.com>; Fri, 03 Sep 2021 08:52:16 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id
	k37mr3415205lfv.655.1630684336092; 
	Fri, 03 Sep 2021 08:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
	<CAHc6FU7K0Ho=nH6fCK+Amc7zEg2G31v+gE3920ric3NE4MfH=A@mail.gmail.com>
In-Reply-To: <CAHc6FU7K0Ho=nH6fCK+Amc7zEg2G31v+gE3920ric3NE4MfH=A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Sep 2021 08:52:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
Message-ID: <CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
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
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
	deadlocks
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

On Wed, Sep 1, 2021 at 12:53 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> So there's a minor merge conflict between Christoph's iomap_iter
> conversion and this patch queue now, and I should probably clarify the
> description of "iomap: Add done_before argument to iomap_dio_rw" that
> Darrick ran into. Then there are the user copy issues that Al has
> pointed out. Fixing those will create superficial conflicts with this
> patch queue, but probably nothing serious.
>
> So how should I proceed: do you expect a v8 of this patch queue on top
> of the current mainline?

So if you rebase for fixes, it's going to be a "next merge window" thing again.

Personally, I'm ok with the series as is, and the conflict isn't an
issue. So I'd take it as is, and then people can fix up niggling
issues later.

But if somebody screams loudly..

             Linus

