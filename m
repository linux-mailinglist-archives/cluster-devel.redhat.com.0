Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A651B7F87
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Sep 2019 19:02:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67AA330872C5;
	Thu, 19 Sep 2019 17:02:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 973085D9CC;
	Thu, 19 Sep 2019 17:02:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DAC9F180085A;
	Thu, 19 Sep 2019 17:02:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8JH1vJH003767 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 13:01:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5A3960C80; Thu, 19 Sep 2019 17:01:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEBFA60BF1;
	Thu, 19 Sep 2019 17:01:54 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 339CB2A09CD;
	Thu, 19 Sep 2019 17:01:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 80CD768B20; Thu, 19 Sep 2019 19:01:48 +0200 (CEST)
Date: Thu, 19 Sep 2019 19:01:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190919170148.GA8908@lst.de>
References: <20190917152140.GU2229799@magnolia>
	<CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 19 Sep 2019 17:01:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 19 Sep 2019 17:01:53 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'verein.lst.de' FROM:'hch@lst.de'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 19 Sep 2019 17:02:08 +0000 (UTC)

On Wed, Sep 18, 2019 at 06:31:29PM -0700, Linus Torvalds wrote:
> It seems to have come from "list_empty()", but the difference is that
> it actually makes sense to check for emptiness of a list outside
> whatever lock that protects the list. It can be one of those very
> useful optimizations where you don't even bother taking the lock if
> you can optimistically check that the list is empty.
> 
> But the same is _not_ true of an operation like "list_pop()". By
> definition, the list you pop something off has to be stable, so the
> READ_ONCE() makes no sense here.

Indeed.

> Anyway, if that was the only issue, I wouldn't care. But looking
> closer, the whole thing is just completely wrong.
> 
> All the users seem to do some version of this:
> 
>         struct list_head tmp;
> 
>         list_replace_init(&ioend->io_list, &tmp);
>         iomap_finish_ioend(ioend, error);
>         while ((ioend = list_pop_entry(&tmp, struct iomap_ioend, io_list)))
>                 iomap_finish_ioend(ioend, error);
> 
> which is completely wrong and pointless.
> 
> Why would anybody use that odd "list_pop()" thing in a loop, when what
> it really seems to just want is that bog-standard
> "list_for_each_entry_safe()"
> 
>         struct list_head tmp;
>         struct iomap_ioend *next;
> 
>         list_replace_init(&ioend->io_list, &tmp);
>         iomap_finish_ioend(ioend, error);
>         list_for_each_entry_safe(struct iomap_ioend, next, &tmp, io_list)
>                 iomap_finish_ioend(ioend, error);
> 
> which is not only the common pattern, it's more efficient and doesn't
> pointlessly re-write the list for each entry, it just walks it (and
> the "_safe()" part is because it looks up the next entry early, so
> that the entry that it's walking can be deleted).

That might be true for the current two cases that operate on a temporary
local list, but in general we have lots of cases where we operate on
lists that are not just local and where have to delete all the entries.

Sure, we could somehow let them dangle and then just do a INIT_LIST_HEAD
on the list later, but that is just asking for trouble down the road
when people actually use list_empty in the functions called in the loop.

