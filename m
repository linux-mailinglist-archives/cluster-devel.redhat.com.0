Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F658F4C5
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Aug 2022 01:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660173458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mf4ac8fVspvGcWxrOWEut1SK8rLHEYFOaT0I3ndebsw=;
	b=ZuxwuhzxJcHyb0rZzRpizcpViurXn8vwlrBuGddvp6Qpp8OWMgZX4wKRooI0/rH6pIJKDE
	eY0Ax5a6Lu2qgq05w3d8AUmDSnEQI4nchEceEeXp39DkClFVvJcf05XGAYzHqbHkFkgyR/
	J79tTPfK+vemLomoGEApR13u24FGmWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-bdqSTFb5NmuiDZSjr8sCMw-1; Wed, 10 Aug 2022 19:17:37 -0400
X-MC-Unique: bdqSTFb5NmuiDZSjr8sCMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C00AA80A0BF;
	Wed, 10 Aug 2022 23:17:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 938E3945D0;
	Wed, 10 Aug 2022 23:17:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 255561946A59;
	Wed, 10 Aug 2022 23:17:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACA4B1946A4F for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 Aug 2022 23:17:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 97DDA1415129; Wed, 10 Aug 2022 23:17:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93B751415124
 for <cluster-devel@redhat.com>; Wed, 10 Aug 2022 23:17:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7788E804196
 for <cluster-devel@redhat.com>; Wed, 10 Aug 2022 23:17:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-bgdjaBP8MCGekZD7d4omQQ-1; Wed, 10 Aug 2022 19:17:29 -0400
X-MC-Unique: bgdjaBP8MCGekZD7d4omQQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oLux1-00HOHQ-P6; Wed, 10 Aug 2022 23:17:23 +0000
Date: Thu, 11 Aug 2022 00:17:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <YvQ8gwsKZlOH6mlP@casper.infradead.org>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
 <20220729092216.GE3493@suse.de> <20220729141145.GA31605@lst.de>
 <Yufx5jpyJ+zcSJ4e@cmpxchg.org>
 <YvQYjpDHH5KckCrw@casper.infradead.org>
 <CAHpGcMLNKrOFxktaH9Wxq0M9O-m+DPrdbB7FQt7qwkzQdm-a-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMLNKrOFxktaH9Wxq0M9O-m+DPrdbB7FQt7qwkzQdm-a-w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Linux-MM <linux-mm@kvack.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Mel Gorman <mgorman@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 10, 2022 at 11:32:06PM +0200, Andreas Grünbacher wrote:
> Am Mi., 10. Aug. 2022 um 22:57 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> > On Mon, Aug 01, 2022 at 11:31:50AM -0400, Johannes Weiner wrote:
> > > XFS hasn't had a ->writepage call for a while. After LSF I internally
> > > tested dropping btrfs' callback, and the results looked good: no OOM
> > > kills with dirty/writeback pages remaining, performance parity. Then I
> > > went on vacation and Christoph beat me to the patch :)
> >
> > To avoid duplicating work with you or Christoph ... it seems like the
> > plan is to kill ->writepage entirely soon, so there's no point in me
> > doing a sweep of all the filesystems to convert ->writepage to
> > ->write_folio, correct?
> >
> > I assume the plan for filesystems which have a writepage but don't have
> > a ->writepages (9p, adfs, affs, bfs, ecryptfs, gfs2, hostfs, jfs, minix,
> > nilfs2, ntfs, ocfs2, reiserfs, sysv, ubifs, udf, ufs, vboxsf) is to give
> > them a writepages, modelled on iomap_writepages().  Seems that adding
> > a block_writepages() might be a useful thing for me to do?
> 
> Hmm, gfs2 does have gfs2_writepages() and gfs2_jdata_writepages()
> functions, so it should probably be fine.

Ah, it's gfs2_aspace_writepage which doesn't have a writepages
counterpart.  I haven't looked at it to understand why it's needed.
(gfs2_meta_aops and gfs2_rgrp_aops)

