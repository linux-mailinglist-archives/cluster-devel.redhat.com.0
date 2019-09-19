Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ED955B7F89
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Sep 2019 19:03:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 754A610DCCA1;
	Thu, 19 Sep 2019 17:03:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3043867615;
	Thu, 19 Sep 2019 17:03:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6E4F1808876;
	Thu, 19 Sep 2019 17:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8JH3px2003867 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 13:03:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF8FD5D9D3; Thu, 19 Sep 2019 17:03:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB4B5D9CD
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 17:03:51 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CC6081DF1
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 17:03:50 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r2so2906553lfn.8
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e+Le165FOxvtzRMwfFqjOH0U+XVnKpWjfAd4ukIEWR4=;
	b=FL9rhk1LXaWaOToMWtkofnf+ifZC7L6LjK+IHdHsF/ZjKrMGyWQHvozYfnjOkbc2Aa
	NaQT+Ln1+A5psdVMqEdRU37SGn1dPcL1GnHoARhDT9QcKBubA/swLTsvj8azaK1+sKlm
	HBGHGssbScaIPzuXiY0UhyHgSHDfp0ZEzinrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e+Le165FOxvtzRMwfFqjOH0U+XVnKpWjfAd4ukIEWR4=;
	b=FfEX5yb3r2v5I/ha3MXYouVk7RRxNl5sl9o5H6htHAXpMk5VwxKNriB09XevCMMYam
	PzwHY0DuaLkpWWfE3dIut0XddzVUGdJvsYXBsHZVw1effg5BJ7aEHY+RQpzCSQQHYbqO
	BseYryZTPP5qaAxnnHqGQtOdGAv/hS/K+5VcSDbC0ClNFP5VkUBJ4RXvTJMC1kv+K67D
	ipLnsu1m84eOJNE/pq7T+fxqLFC1ZzU7R/WSultT47xKYQ7ODTn+DRqraCuRRT32edGh
	cv6WDDtDhnQ64cEU5Bmxm6CnEa780SbE7b4vdD6dmFrwCIChLD0/P9J8A8tfQV0k/U4L
	B1zw==
X-Gm-Message-State: APjAAAXYaQ10Em3WKxIR3r4IFQlfTpKI7gHZM06ZhGn/b6XVzKUL/W9g
	UC9UbQhsnoUIDwNtoVMRLdQs27p41pk=
X-Google-Smtp-Source: APXvYqwZBbnfESNXF26ORjjllQpVLkAZXUjqkBwIiNLWSqEmib02aAJ2kiNsbf+aUIgBBKde214sJQ==
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr867351lfq.179.1568912628054; 
	Thu, 19 Sep 2019 10:03:48 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
	[209.85.167.53]) by smtp.gmail.com with ESMTPSA id
	134sm1690894lfk.70.2019.09.19.10.03.46 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Sep 2019 10:03:47 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id d17so2916250lfa.7
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 10:03:46 -0700 (PDT)
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr5667771lfp.61.1568912626555; 
	Thu, 19 Sep 2019 10:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190917152140.GU2229799@magnolia>
	<CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
	<20190919034502.GJ2229799@magnolia>
In-Reply-To: <20190919034502.GJ2229799@magnolia>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2019 10:03:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgFRM=z6WS-QLThxL2T1AaoCQeZSoHzj8ak35uSePQVbA@mail.gmail.com>
Message-ID: <CAHk-=wgFRM=z6WS-QLThxL2T1AaoCQeZSoHzj8ak35uSePQVbA@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 19 Sep 2019 17:03:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 19 Sep 2019 17:03:50 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dave Chinner <david@fromorbit.com>, "Darrick J. Wong" <djwong@kernel.org>,
	Eric Sandeen <sandeen@sandeen.net>,
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 19 Sep 2019 17:03:55 +0000 (UTC)

On Wed, Sep 18, 2019 at 8:45 PM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> I propose the following (assuming Linus isn't cranky enough to refuse
> the entire iomap patchpile forever):

Since I don't think the code was _wrong_, it was just that I didn't
want to introduce a new pattern for something we already have, I'd be
ok with just a fix patch on top too.

And if the xfs people really want to use the "pop" model, that's fine
too - just make it specific to just the iomap_ioend type, which is all
you seem to really want to pop, and make the typing (and naming) be
about that particular thing.

As mentioned, I don't think that whole "while (pop)" model is _wrong_
per se.  But I also don't like proliferating new random list users in
general, just because some subsystem has some internal preference.
See?

And I notice that one of the users actually does keep the list around
and modifies it, ie this one:

        while ((ioend = list_pop_entry(&tmp, struct xfs_ioend, io_list))) {
                xfs_ioend_try_merge(ioend, &tmp);
                xfs_end_ioend(ioend);
        }

actually seems to _work_ on the remaining part of the list in that
xfs_ioend_try_merge() function.

So inside of xfs, that "pop ioend from the list" model really may make
perfect sense, and you could just do

    static inline struct xfs_ioend *xfs_pop_ioend(struct list_head *head)
    {
        struct xfs_ioend *ioend = list_first_entry_or_null(head,
struct xfs_ioend *, io_list);
        if (ioend)
                list_del(&ioend->io_list);
        return ioend;
    }

and I don't think it's wrong.

It's just that we've survived three decades without that list_pop(),
and I don't want to make our header files even bigger and more complex
unless we actually have multiple real users.

             Linus

