Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EF54AB711C
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Sep 2019 03:32:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20E80C04B31E;
	Thu, 19 Sep 2019 01:32:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2151D5D9E5;
	Thu, 19 Sep 2019 01:32:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ED1D4EE68;
	Thu, 19 Sep 2019 01:32:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1VrU1011404 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:31:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 848B05DA21; Thu, 19 Sep 2019 01:31:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DC2B5D9E5
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 01:31:51 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430A2806A49
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 01:31:50 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l21so1845607lje.4
	for <cluster-devel@redhat.com>; Wed, 18 Sep 2019 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uJ4ydVPnUk1MpO9iHZC8eadZdfXIfU9vawn2F3Ib1fo=;
	b=A0YUpl9WGKzUNGpQlDZCnUNq6eUYinpLyOjjYEWw9qMpylivgUSR6LUyPDngKcRQfO
	CG9fCIJMna6iMWF1LQ7ztmKybh1kW4q5WyqsVkqC2UC0ZmH4W8gyqqZ+vDToxilfbXhs
	SCFR9Wb1ioaYc1GAqKixI4+MGwt/qdu3yOajg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uJ4ydVPnUk1MpO9iHZC8eadZdfXIfU9vawn2F3Ib1fo=;
	b=NXepjGxi/9ioraO0/OiZTLZA5pq7Xp07rKaf0LELku+bpVhp+IYmHZ3VGHkUgwX9t3
	AMR1g4QnRXUlTBGad4Qmw4wE91HBCrmo0cWBWQYhRbbYPIK24akOcsLBHJ3VjgSSbxXy
	sEtvQv309I7SOe/iaGyzszrsD5sMUMOJjRNbhRoQwq2USqByDv5u6CSUzJGRwq2bW98b
	oLQyu4k4Xsk8+fwNLLiiondpFwl6YHWF7ysQtMSf6Tc6uRlKafbHm+U48V3oUth8l3v9
	tY5xGgG9fqzgQhE+pKtZOyAHaezaJk7/mxo+Qjq3yPFOqE8IlgrLXTvb1+111IZqWlyM
	KfVg==
X-Gm-Message-State: APjAAAUVk6IWYXuTK1Dp6tSmq7hCvJrN/fibbuxcCQ8/qvppCHx2xAR+
	vwsfc9cVeJV0aT/Yte2JLuHTAmUsRXQ=
X-Google-Smtp-Source: APXvYqxcLtwHEGjODllXkCWiF+wHhZK5ySOZKQ6bA9x+v9gPZ9DM167csY+dPytDnNjHUvt2uyMN+w==
X-Received: by 2002:a2e:95cf:: with SMTP id y15mr3802073ljh.27.1568856707635; 
	Wed, 18 Sep 2019 18:31:47 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
	[209.85.167.52]) by smtp.gmail.com with ESMTPSA id
	u21sm1341638lje.92.2019.09.18.18.31.46 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Sep 2019 18:31:46 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id d17so1056344lfa.7
	for <cluster-devel@redhat.com>; Wed, 18 Sep 2019 18:31:46 -0700 (PDT)
X-Received: by 2002:a19:f204:: with SMTP id q4mr3489622lfh.29.1568856706072;
	Wed, 18 Sep 2019 18:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190917152140.GU2229799@magnolia>
In-Reply-To: <20190917152140.GU2229799@magnolia>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Sep 2019 18:31:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
Message-ID: <CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Thu, 19 Sep 2019 01:31:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Thu, 19 Sep 2019 01:31:50 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com' HELO:'mail-lj1-f193.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 19 Sep 2019 01:32:05 +0000 (UTC)

On Tue, Sep 17, 2019 at 8:21 AM Darrick J. Wong <djwong@kernel.org> wrote:
>
> Please pull this series containing all the new iomap code for 5.4.

So looking at the non-iomap parts of it, I react to the new "list_pop() code.

In particular, this:

        struct list_head *pos = READ_ONCE(list->next);

is crazy to begin with..

It seems to have come from "list_empty()", but the difference is that
it actually makes sense to check for emptiness of a list outside
whatever lock that protects the list. It can be one of those very
useful optimizations where you don't even bother taking the lock if
you can optimistically check that the list is empty.

But the same is _not_ true of an operation like "list_pop()". By
definition, the list you pop something off has to be stable, so the
READ_ONCE() makes no sense here.

Anyway, if that was the only issue, I wouldn't care. But looking
closer, the whole thing is just completely wrong.

All the users seem to do some version of this:

        struct list_head tmp;

        list_replace_init(&ioend->io_list, &tmp);
        iomap_finish_ioend(ioend, error);
        while ((ioend = list_pop_entry(&tmp, struct iomap_ioend, io_list)))
                iomap_finish_ioend(ioend, error);

which is completely wrong and pointless.

Why would anybody use that odd "list_pop()" thing in a loop, when what
it really seems to just want is that bog-standard
"list_for_each_entry_safe()"

        struct list_head tmp;
        struct iomap_ioend *next;

        list_replace_init(&ioend->io_list, &tmp);
        iomap_finish_ioend(ioend, error);
        list_for_each_entry_safe(struct iomap_ioend, next, &tmp, io_list)
                iomap_finish_ioend(ioend, error);

which is not only the common pattern, it's more efficient and doesn't
pointlessly re-write the list for each entry, it just walks it (and
the "_safe()" part is because it looks up the next entry early, so
that the entry that it's walking can be deleted).

So I pulled it. But then after looking at it, I unpulled it again
because I don't want to see this kind of insanity in one of THE MOST
CORE header files we have in the whole kernel.

If xfs and iomap want to think they are "popping" a list, they can do
so. In the privacy of your own home, you can do stupid and pointless
things.

But no, we don't pollute core kernel code with those stupid and
pointless things.

              Linus

