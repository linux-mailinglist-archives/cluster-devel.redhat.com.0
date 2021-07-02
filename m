Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8123B9A35
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jul 2021 02:46:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-0DjR5I0OOlSPvRhLdY5o8g-1; Thu, 01 Jul 2021 20:46:40 -0400
X-MC-Unique: 0DjR5I0OOlSPvRhLdY5o8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46A148030D7;
	Fri,  2 Jul 2021 00:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F9960871;
	Fri,  2 Jul 2021 00:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28FC01809C98;
	Fri,  2 Jul 2021 00:46:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1620Uqn7027636 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 20:30:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B48410F059; Fri,  2 Jul 2021 00:30:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9621D10F02E
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 00:30:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A19D41857F10
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 00:30:49 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-En8I7Nn7N2iS03RRueGovA-1; Thu, 01 Jul 2021 20:30:47 -0400
X-MC-Unique: En8I7Nn7N2iS03RRueGovA-1
Received: by mail-lf1-f54.google.com with SMTP id bq39so2417678lfb.12
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 17:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bJvQk/Alftrz3YVUjbu29T6DoGupesSg/dDRXRbYPhA=;
	b=KS5VfoVV3AL4mZOPYHol5X2j3Ep4a0Qw5MKbwRISAbwj2SGZUpSzLqhuc/DAnshhCH
	Lyeubl5JYjIfwwoHm3v1Ry3uJZ/AzMZjboSNVLv3IhtxJ419/dwmVSwzGt6Jsw9xZlhi
	dNw9UrLYxB1e8wwDqMfJLCMIRQ6SzBWYy9I9518kLurA3QpzgguOGykrPw4qnXt4niKS
	WdAXNaWeF+w1jZh8br5a+/PGkwejuiY+f6cuoNy1DrSaHJTS0HWXPZkLCzdFuPmbkDw0
	WBoBMbHVfBhXuaSxBZ0j4Op73Xq0zBldzNlFX1aISrNGgOONnqbKKR8RtH8Sr9KCZsgi
	4JmQ==
X-Gm-Message-State: AOAM5300a2dM0q1BfCTkQR/ZokfqebBzTbSDwKI/QFtDleRHvBxsY8ov
	hI3KjN8qDCpMMliFXpypADbbdCCPfdbLTyujafk=
X-Google-Smtp-Source: ABdhPJxTVOXXB4z8eiKbpq7h/HdXjz/HIpWciw4w/zBhGg9HAy2W4YpEL/6psQCJcJ713S4yfbu+Bg==
X-Received: by 2002:a05:6512:3155:: with SMTP id
	s21mr1618192lfi.358.1625185845527; 
	Thu, 01 Jul 2021 17:30:45 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54]) by smtp.gmail.com with ESMTPSA id
	p19sm172048ljm.129.2021.07.01.17.30.44 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 01 Jul 2021 17:30:44 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id k10so14946906lfv.13
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 17:30:44 -0700 (PDT)
X-Received: by 2002:ac2:4903:: with SMTP id n3mr551418lfi.487.1625185844416;
	Thu, 01 Jul 2021 17:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210701204246.2037142-1-agruenba@redhat.com>
	<CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
	<CAHc6FU5XMfTOBW1a0OnMaPSmgWECvO-KYAo8HeVNsCyd-HyV3g@mail.gmail.com>
In-Reply-To: <CAHc6FU5XMfTOBW1a0OnMaPSmgWECvO-KYAo8HeVNsCyd-HyV3g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Jul 2021 17:30:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whaRsSuUeVBn_rLECWyG6h9RGuF9idsT_S+==vnsT8org@mail.gmail.com>
Message-ID: <CAHk-=whaRsSuUeVBn_rLECWyG6h9RGuF9idsT_S+==vnsT8org@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 5:20 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> On Thu, Jul 1, 2021 at 11:41 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > Also, I have to say that I think the direct-IO code is fundamentally
> > mis-designed. Why it is doing the page lookup _during_ the IO is a
> > complete mystery to me. Why wasn't that done ahead of time before the
> > filesystem took the locks it needed?
>
> That would be inconvenient for reads, when the number of bytes read is
> much smaller than the buffer size and we won't need to page in the
> entire buffer.

What?

A file read will READ THE WHOLE BUFFER.

We're not talking pipes or ttys here. If you ask for X bytes, you'll
get X bytes.

Of course, if you ask for more data than the file has, that's another
thing, but who really does that with direct-IO? And if they do, why
should we care about their silly behavior?

Face it, right now direct-IO is *BUGGY* because of this, and you can
deadlock filesystems with it.

So tell me again how it's "inconvenient" to fix this bug, and fix the
bad direct-IO design?

              Linus

