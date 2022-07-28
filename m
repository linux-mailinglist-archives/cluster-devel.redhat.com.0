Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F76584D6C
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Jul 2022 10:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659083699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FThKBW22ogMZ47y3LqB8ynEnI2mNCgS8VuEq+ywlvPw=;
	b=d8TzYqKzoSPQYIRXFguslFSVZPX4v2Mh0Qap6uu7Vf499K3MMylM8+VNGd+aTyRKafC5y4
	ytNFpyCCcUjvP6STZNgkUHNZIcsjcq8Wnz0JeqnRJPiAqC4Dd1SRTR9QzJy5xT3uRYZDst
	VsLyE6+RcJMXO5FM/enT2DCdQqrQ1sc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-73RQCEI4N82E6Y01RrmUxg-1; Fri, 29 Jul 2022 04:34:56 -0400
X-MC-Unique: 73RQCEI4N82E6Y01RrmUxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19D0D80029D;
	Fri, 29 Jul 2022 08:34:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51E1740CFD0A;
	Fri, 29 Jul 2022 08:34:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E2101932121;
	Fri, 29 Jul 2022 08:34:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2CDF1945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Jul 2022 23:26:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEB2A40CF8EB; Thu, 28 Jul 2022 23:26:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB18A400DFD7
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 23:26:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FC5C85A588
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 23:26:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-Heb4jB2UNi2Ykqhjt3Mq_g-1; Thu, 28 Jul 2022 19:26:34 -0400
X-MC-Unique: Heb4jB2UNi2Ykqhjt3Mq_g-1
Received: by mail-pj1-f41.google.com with SMTP id y1so3153304pja.4;
 Thu, 28 Jul 2022 16:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FThKBW22ogMZ47y3LqB8ynEnI2mNCgS8VuEq+ywlvPw=;
 b=wOkaFz1ZHygcXcNQfZa3yUce2urJHAMIgH/a0t7vXuQiwOwpxHvSn0RZEx3zLpoSey
 PMJZHunAKpE3VIV8ttujUixvnfL5nTnpbwHxVbTjxjhvLRvOhUo/34lKVCZtwX7XAlBB
 r92shi04KhX5u954yoLzbrRXc4m8nq7q9HJZwMtDIneaNp6o2bbO7YQ7yBBgC+1VYw+9
 3hCOOLKfGeF3sGG+/2VJIeF7Vth0oEykG9rN8lKcdvT/8b0X8sIqLYgGDnDuyrHoAxQN
 toNAu4TFVGf967jMjnOFC446Tiw+QJh2xOItJyCeVaCcO+T1vyMahyavGJxtdY3E5PUx
 SpOA==
X-Gm-Message-State: ACgBeo1+Tzukf8IL/GzC0+mHNg17jhIQWRqGZXgfj+e6qoEKziZcbdep
 pycIPubAhCsfNX5V/OXSVVjOzxgOUzjPCM1CpRs=
X-Google-Smtp-Source: AA6agR5nvgMY86Y4sS/smtiWS4Mu1pYIFaY23gz00YkgOpJys8r91kVGv4QlE6/ujnAEXKtFvGqA+lRvB4hNhgDPpjs=
X-Received: by 2002:a17:902:a516:b0:16d:4379:f34a with SMTP id
 s22-20020a170902a51600b0016d4379f34amr1176999plq.26.1659050793250; Thu, 28
 Jul 2022 16:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
 <YuKam52dkTGycay2@casper.infradead.org>
 <20220728224803.GZ3861211@dread.disaster.area>
In-Reply-To: <20220728224803.GZ3861211@dread.disaster.area>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 28 Jul 2022 16:26:20 -0700
Message-ID: <CAHbLzkptH+U9DP4yfGUfyOex47OQgYd2fOZYtCOxOr1S2ZTEeQ@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 29 Jul 2022 08:34:52 +0000
Subject: Re: [Cluster-devel] remove iomap_writepage v2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 3:48 PM Dave Chinner <david@fromorbit.com> wrote:
>
> On Thu, Jul 28, 2022 at 03:18:03PM +0100, Matthew Wilcox wrote:
> > On Thu, Jul 28, 2022 at 01:10:16PM +0200, Jan Kara wrote:
> > > Hi Christoph!
> > >
> > > On Tue 19-07-22 06:13:07, Christoph Hellwig wrote:
> > > > this series removes iomap_writepage and it's callers, following what xfs
> > > > has been doing for a long time.
> > >
> > > So this effectively means "no writeback from page reclaim for these
> > > filesystems" AFAICT (page migration of dirty pages seems to be handled by
> > > iomap_migrate_page()) which is going to make life somewhat harder for
> > > memory reclaim when memory pressure is high enough that dirty pages are
> > > reaching end of the LRU list. I don't expect this to be a problem on big
> > > machines but it could have some undesirable effects for small ones
> > > (embedded, small VMs). I agree per-page writeback has been a bad idea for
> > > efficiency reasons for at least last 10-15 years and most filesystems
> > > stopped dealing with more complex situations (like block allocation) from
> > > ->writepage() already quite a few years ago without any bug reports AFAIK.
> > > So it all seems like a sensible idea from FS POV but are MM people on board
> > > or at least aware of this movement in the fs land?
> >
> > I mentioned it during my folio session at LSFMM, but didn't put a huge
> > emphasis on it.
> >
> > For XFS, writeback should already be in progress on other pages if
> > we're getting to the point of trying to call ->writepage() in vmscan.
> > Surely this is also true for other filesystems?
>
> Yes.
>
> It's definitely true for btrfs, too, because btrfs_writepage does:
>
> static int btrfs_writepage(struct page *page, struct writeback_control *wbc)
> {
>         struct inode *inode = page->mapping->host;
>         int ret;
>
>         if (current->flags & PF_MEMALLOC) {
>                 redirty_page_for_writepage(wbc, page);
>                 unlock_page(page);
>                 return 0;
>         }
> ....
>
> It also rejects all calls to write dirty pages from memory reclaim
> contexts.

Aha, it seems even kswapd (it has PF_MEMALLOC set) is rejected too.

>
> ext4 will also reject writepage calls from memory allocation if
> block allocation is required (due to delayed allocation) or
> unwritten extents need converting to written. i.e. if it has to run
> blocking transactions.
>
> So all three major filesystems will either partially or wholly
> reject ->writepage calls from memory reclaim context.
>
> IOWs, if memory reclaim is depending on ->writepage() to make
> reclaim progress, it's not working as advertised on the vast
> majority of production Linux systems....
>
> The reality is that ->writepage is a relic of a bygone era of OS and
> filesystem design. It was useful in the days where writing a dirty
> page just involved looking up the bufferhead attached to the page to
> get the disk mapping and then submitting it for IO.
>
> Those days are long gone - filesystems have complex IO submission
> paths now that have to handle delayed allocation, copy-on-write,
> unwritten extents, have unbound memory demand, etc. All the
> filesystems that support these 1990s era filesystem technologies
> simply turn off ->writepage in memory reclaim contexts.
>
> Hence for the vast majority of linux users (i.e. everyone using
> ext4, btrfs and XFS), ->writepage no longer plays any part in memory
> reclaim on their systems.
>
> So why should we try to maintain the fiction that ->writepage is
> required functionality in a filesystem when it clearly isn't?
>
> Cheers,
>
> Dave.
> --
> Dave Chinner
> david@fromorbit.com
>

