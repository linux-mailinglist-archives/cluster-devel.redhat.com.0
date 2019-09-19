Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C146B7169
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Sep 2019 04:08:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4064818C4271;
	Thu, 19 Sep 2019 02:08:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4AD65D6A5;
	Thu, 19 Sep 2019 02:08:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A920D1808878;
	Thu, 19 Sep 2019 02:08:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J28K5O013291 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 22:08:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13C5760A9F; Thu, 19 Sep 2019 02:08:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE5260872
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 02:08:17 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 835BE18CB8EA
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 02:08:16 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id d5so1858516lja.10
	for <cluster-devel@redhat.com>; Wed, 18 Sep 2019 19:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5Xuld3BlUHhLVm41JSQ0g37C/9G156A47j1pRWimdvw=;
	b=K4bnmhnBOLjP8CCgm9SQOLs8Azqf3H69cXUe+ZDqGsJNsVyqgu4XmqoP9IeTJLNk2l
	//0jhii85ZMd5vOF7E688yX86AzktkkMYhlQ07aMMj+h5+afd2UQCp7atEt6iXXdF2LU
	RRh/vpBYAp69fsqpH8cadS17r2gGFQbSW0FSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5Xuld3BlUHhLVm41JSQ0g37C/9G156A47j1pRWimdvw=;
	b=jigzTZju03ErPSbVWohzxnsngKactbx2UFujPc0yIyBKjlul1L5K68Q2A1vzhb5gxE
	/x5PcynMxBHcdvlHkuIbZa2QPxahquta1QDu7YkrnJ6ayaGYlQzhy7WIhmCkK7Ee5eaa
	dmHYC8SGQarga7rucLyP3W+QIGYjQmjD1wLWSbwX5nqvqQL3JK1UtJfiTNyMqSydPgta
	wE9Andf/O+w0hejx1yox0If+IhptZKPLCVTq9j+US3tWsR9AIekT6ORp2priq/6fWsx7
	CnoCrBRksZ5q1liE8NF6EqNhiCeC5Qoiq0GUsC/4Kry7KrPF8pugGamze0RrmBu5jW91
	OQ5A==
X-Gm-Message-State: APjAAAVRG3Gs9fsOT9TtYqzkHLZDwlk/9shYdM5LzS/w2ETyWWq1hZOF
	V9p7tQfRWPGaMzMiYerQt8VMpLZ1zEw=
X-Google-Smtp-Source: APXvYqyafNpqX7ayiyQjpxUVa5ixdzlZ/6aS3smyOJHXnyLR4vFhvNL7W0NKsOCE6Pc08C6xRxIjrA==
X-Received: by 2002:a2e:9605:: with SMTP id v5mr4041691ljh.49.1568858894739;
	Wed, 18 Sep 2019 19:08:14 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
	[209.85.167.48])
	by smtp.gmail.com with ESMTPSA id h9sm1270062lfp.40.2019.09.18.19.08.13
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Sep 2019 19:08:13 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id w6so1121507lfl.2
	for <cluster-devel@redhat.com>; Wed, 18 Sep 2019 19:08:13 -0700 (PDT)
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr3524864lfn.52.1568858892842; 
	Wed, 18 Sep 2019 19:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190917152140.GU2229799@magnolia>
	<CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
In-Reply-To: <CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Sep 2019 19:07:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXBV57mz46ZB5XivjiSBGkM0cjuvnU2OWyfRF=+41NPQ@mail.gmail.com>
Message-ID: <CAHk-=wgXBV57mz46ZB5XivjiSBGkM0cjuvnU2OWyfRF=+41NPQ@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.63]);
	Thu, 19 Sep 2019 02:08:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Thu, 19 Sep 2019 02:08:16 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com' HELO:'mail-lj1-f193.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [GIT PULL] iomap: new code for 5.4
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Thu, 19 Sep 2019 02:08:25 +0000 (UTC)

On Wed, Sep 18, 2019 at 6:31 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Why would anybody use that odd "list_pop()" thing in a loop, when what
> it really seems to just want is that bog-standard
> "list_for_each_entry_safe()"

Side note: I do agree that the list_for_each_entry_safe() thing isn't
exactly beautiful, particularly since you need that extra variable for
the temporary "next" pointer.

It's one of the C++ features I'd really like to use in the kernel -
the whole "declare new variable in a for (;;) statement" thing.

In fact, it made it into C - it's there in C99 -  but we still use
"-std=gnu89" because of other problems with the c99 updates.

Anyway, I *would* be interested in cleaning up
list_for_each_entry_safe() if somebody has the energy and figures out
what we could do to get the c99 behavior without the breakage from
other sources.

For some background: the reason we use "gnu89" is because we use the
GNU extension with type cast initializers quite a bit, ie things like

    #define __RAW_SPIN_LOCK_UNLOCKED(lockname)      \
        (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)

and that broke in c99 and gnu99, which considers those compound
literals and you can no longer use them as initializers.

See

    https://lore.kernel.org/lkml/20141019231031.GB9319@node.dhcp.inet.fi/

for some of the historical discussion about this. It really _is_ sad,
because variable declarations inside for-loops are very useful, and
would have the potential to make some of our "for_each_xyz()" macros a
lot prettier (and easier to use too).

So our list_for_each_entry_safe() thing isn't perfect, but that's no
reason to try to then make up completely new things.

             Linus

