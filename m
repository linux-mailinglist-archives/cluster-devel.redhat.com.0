Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC6273A5108
	for <lists+cluster-devel@lfdr.de>; Sat, 12 Jun 2021 23:39:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-_k7LHoQRME-Xs1y_RQrf6w-1; Sat, 12 Jun 2021 17:39:43 -0400
X-MC-Unique: _k7LHoQRME-Xs1y_RQrf6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D319F92B;
	Sat, 12 Jun 2021 21:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F371037E86;
	Sat, 12 Jun 2021 21:39:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82CC21801264;
	Sat, 12 Jun 2021 21:39:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CLXtmk008371 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 17:33:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1598420230A7; Sat, 12 Jun 2021 21:33:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11382200BA92
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB5085828E
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:33:52 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-106-rYzxyLgtM26A6UtAhjy9hA-1; Sat, 12 Jun 2021 17:33:50 -0400
X-MC-Unique: rYzxyLgtM26A6UtAhjy9hA-1
Received: by mail-lj1-f182.google.com with SMTP id s22so14467448ljg.5
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 14:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cttjN6hHK8ZfFZCCvG0xFSEaYGvtzoV+qTXYo7qsc7k=;
	b=f5BbAGyBmXu7qqBfdesXh7b6mPD77CIa3YRoiRxkX6c/5pRJ7ZsDGwM1qeIirnFFeU
	/ULk1rqCZCe7CLkeiXn36umgpV8XDW8V4BoT88YZd+/uAOpzllvYwCiXlhGoosd+jzpq
	V2fuPyEUMLlDZ2GzNVL3RtcgMAbsE7INk5N+zTUldiagiQdm0egMj5B9PiYaDPxSpIWT
	JGU9/FZC0YhxFUzwLO4/Tgx+z26wf2mKMhlwu58ElCOuuYXDK7i5FgBNfqIIERrc1N1a
	E6jAC9ZzcSoR7Kfh/VVgz0fsLptmNcTU7uYJjqd/qrKWCZ6jXQiB8T8qfFm9Emfh1I2x
	z30g==
X-Gm-Message-State: AOAM532LZ9J6N2hQ6BQB681esZWyGaTX/bS6MJuPESr5meKZKq98kkBG
	8podXZvu9RIPNpI5//lyLdaVsG8f0k2DH+/bvJA=
X-Google-Smtp-Source: ABdhPJwWP/obOXPHWYtn+Ji+L4oKzH9Phmc+/+yDTCTli27mLNPTcSqvZV122UWm9gSoO9XpPNJoXg==
X-Received: by 2002:a05:651c:1138:: with SMTP id
	e24mr7984798ljo.403.1623533628294; 
	Sat, 12 Jun 2021 14:33:48 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
	[209.85.167.53]) by smtp.gmail.com with ESMTPSA id
	l5sm1075319lfc.250.2021.06.12.14.33.47 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 12 Jun 2021 14:33:47 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id j2so14177508lfg.9
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 14:33:47 -0700 (PDT)
X-Received: by 2002:ac2:43b9:: with SMTP id t25mr6993774lfl.253.1623533627053; 
	Sat, 12 Jun 2021 14:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-6-agruenba@redhat.com>
	<YLUY/7pcFMibDnRn@zeniv-ca.linux.org.uk>
	<YMUjQYtBCIxHvsYV@zeniv-ca.linux.org.uk>
In-Reply-To: <YMUjQYtBCIxHvsYV@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Jun 2021 14:33:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whcnziOWqVESWKJ6Y1_sG2S2AOa1vv5yKzUGs5gM7qYpQ@mail.gmail.com>
Message-ID: <CAHk-=whcnziOWqVESWKJ6Y1_sG2S2AOa1vv5yKzUGs5gM7qYpQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [RFC 5/9] iov_iter: Add
	iov_iter_fault_in_writeable()
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

On Sat, Jun 12, 2021 at 2:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Actually, is there any good way to make sure that write fault is triggered
> _without_ modification of the data?  On x86 lock xadd (of 0, that is) would
> probably do it and some of the other architectures could probably get away
> with using cmpxchg and its relatives, but how reliable it is wrt always
> triggering a write fault if the page is currently read-only?

I wouldn't worry about the CPU optimizing a zero 'add' away (extra
work for no gain in any normal situation).

But any architecture using 'ldl/stc' to do atomics would do it in
software for at least cmpxchg (ie just abort after the "doesn't
match").

Even on x86, it's certainly _possible_ that a non-matching cmpxchg
might not have done the writability check, although I would find that
unlikely (ie I would expect it to do just one TLB lookup, and just one
permission check, whether it then writes or not).

And if the architecture does atomic operations using that ldl/stc
model, I could (again) see the software loop breaking out early
(before the stc) on the grounds of "value didn't change".

Although it's a lot less likely outside of cmpxchg. I suspect an "add
zero" would work just fine even on a ldl/stc model.

That said, reads are obviously much easier, and I'd probably prefer
the model for writes to be to not necessarily pre-fault anything at
all, but just write to user space with page faults disabled.

And then only if that fails do you do anything special. And at that
point, even walking the page tables by hand might be perfectly
acceptable - since we know it's going to fault anyway, and it might
actually be cheaper to just do it by hand with GUP or whatever.

          Linus

