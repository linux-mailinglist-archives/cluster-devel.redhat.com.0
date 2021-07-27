Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1025D3D7C9B
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:52:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-LfEBBNLJNtiF3ei86TfI3g-1; Tue, 27 Jul 2021 13:52:11 -0400
X-MC-Unique: LfEBBNLJNtiF3ei86TfI3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF5B287D54C;
	Tue, 27 Jul 2021 17:52:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F11801042A50;
	Tue, 27 Jul 2021 17:52:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 777EA4A7C9;
	Tue, 27 Jul 2021 17:52:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHq2B3025091 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:52:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECA8C10031FF; Tue, 27 Jul 2021 17:52:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E84231008B73
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:51:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 701A0811E78
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:51:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-3W88nj4rP9WZYo91FhDvqw-1; Tue, 27 Jul 2021 13:51:57 -0400
X-MC-Unique: 3W88nj4rP9WZYo91FhDvqw-1
Received: by mail-lf1-f52.google.com with SMTP id d18so23110683lfb.6
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 10:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OBk5RRCD2iLIhOK5co1TZE5o+SAQV6EEDJtV9mSx3y4=;
	b=km6cmHNiph4EIOD5b7pogWKGqcEQTLub1Xw3OoVGwb3ubY1MOBMcWmYS6op0PmdDRw
	c2UkexNPe9yLD7Qi7HPcUx1k4lTaBD7kA65s+qsCpzK2qZl32c5JA35HWktKrts05TXb
	b8HJLb6kruCFHrf/kTImqRBmxS1M/nfC+qz7VWZ3i4+GxNCtIP1OpdCiq7yT9jpEGdJH
	lw2JEkBvLsAoS7GT+AKL+XPqr1SHCfSdAcCosqt/nPMZqsBS0cHlWXcItQTREeRkZuRV
	PaqMUdtLw8uOAcvFQHSvP+B3YDOLf47AdRR48IPrxfEuzV28KGZ7Y+Tg4Z9waQYIyjfN
	8vQQ==
X-Gm-Message-State: AOAM533r6BR0cXhBdHc07j2b+NCIsaSQEYTfTlplzCdIQFzRvG/Uk9E8
	u8s1We9LGXnCwxD/NH956FtoRdWtPIPphmc2K5g=
X-Google-Smtp-Source: ABdhPJyOt3rfdTH9f5udpGwQHHYbZsHTVbhPnBbAsFzls11oAjdqupBoTY2BHAHDZwogo1q6KK0B1Q==
X-Received: by 2002:a05:6512:130f:: with SMTP id
	x15mr8696838lfu.571.1627408315873; 
	Tue, 27 Jul 2021 10:51:55 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
	[209.85.208.178])
	by smtp.gmail.com with ESMTPSA id d8sm333928ljg.86.2021.07.27.10.51.54
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Jul 2021 10:51:55 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id q2so17026639ljq.5
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 10:51:54 -0700 (PDT)
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr15961914ljg.251.1627408314168; 
	Tue, 27 Jul 2021 10:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<03e0541400e946cf87bc285198b82491@AcuMS.aculab.com>
	<CAHc6FU4N7vz+jfoUSa45Mr_F0Ht0_PXroWoc5UNkMgFmpKLaNw@mail.gmail.com>
In-Reply-To: <CAHc6FU4N7vz+jfoUSa45Mr_F0Ht0_PXroWoc5UNkMgFmpKLaNw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Jul 2021 10:51:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=whemWRZRDDvHnesBbTo1hO2qkWkMtGUSfPvEOq7kAfouQ@mail.gmail.com>
Message-ID: <CAHk-=whemWRZRDDvHnesBbTo1hO2qkWkMtGUSfPvEOq7kAfouQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Laight <David.Laight@aculab.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [PATCH v4 1/8] iov_iter: Introduce
	iov_iter_fault_in_writeable helper
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

On Tue, Jul 27, 2021 at 4:14 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> On Tue, Jul 27, 2021 at 11:30 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > Is it actually worth doing any more than ensuring the first byte
> > of the buffer is paged in before entering the block that has
> > to disable page faults?
>
> We definitely do want to process as many pages as we can, especially
> if allocations are involved during a write.

Yeah, from an efficiency standpoint, once you start walking page
tables, it's probably best to just handle as much as you can.

But once you get an error, I don't think it should be "everything is bad".

This is a bit annoying, because while *most* users really just want
that "everything is good", *some* users might just want to handle the
partial success case.

It's why "copy_to/from_user()" returns the number of bytes *not*
written, rather than -EFAULT like get/put_user(). 99% of all users
just want to know "did I write all bytes" (and then checking for a
zero return is a simple and cheap verification of "everything was
ok").

But then very occasionally, you hit a case where you actually want to
know how much of a copy worked. It's rare, but it happens, and the
read/write system calls tend to be the main user of it.

And yes, the fact that "copy_to/from_user()" doesn't return an error
(like get/put_user() does) has confused people many times over the
years. It's annoying, but it's required by those (few) users that
really do want to handle that partial case.

I think this iov_iter_fault_in_readable/writeable() case should do the same.

And no, it's not new to Andreas' patch. iov_iter_fault_in_readable()
is doing the "everything has to be good" thing already.

Which maybe implies that nobody cares about partial reads/writes. Or
it's very very rare - I've seen code that handles page faults in user
space, but it's admittedly been some very special CPU
simulator/emulator checkpointing stuff.

               Linus

