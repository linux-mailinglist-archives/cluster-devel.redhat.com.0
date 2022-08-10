Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 105AC58F39F
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Aug 2022 22:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660164272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2OvXf0xNBrC73fYE6Jm87Hbjynk6ZxeWJjR7VarX35Q=;
	b=GH4Cwprf7p35wdVYOFN+n/VJs9hbXDFJmMicParwE6vzkYPznDavuUIuuBNsoczxT7XBFp
	H47L8+Q2vyZlocWc6ahxdag8uIEYxB+NqMV5u7K7IYsKjFUpXdUpFFic4AWbBfLFmwHotC
	8rPXZbz0IrvrhqyPAjTACs/fTdjPHj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-we4R4Fa9McSJSrDR02FeWA-1; Wed, 10 Aug 2022 16:44:26 -0400
X-MC-Unique: we4R4Fa9McSJSrDR02FeWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 029B518E6C41;
	Wed, 10 Aug 2022 20:44:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 289E72026D64;
	Wed, 10 Aug 2022 20:44:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A19A91946A59;
	Wed, 10 Aug 2022 20:44:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 655791946A4F for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 Aug 2022 20:44:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CC6140D282E; Wed, 10 Aug 2022 20:44:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CE440D2827
 for <cluster-devel@redhat.com>; Wed, 10 Aug 2022 20:44:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E45E118E6C41
 for <cluster-devel@redhat.com>; Wed, 10 Aug 2022 20:44:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-rM2KohLgPRChbwfkwLOnbg-1; Wed, 10 Aug 2022 16:44:07 -0400
X-MC-Unique: rM2KohLgPRChbwfkwLOnbg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oLsYY-00HF0P-FL; Wed, 10 Aug 2022 20:43:58 +0000
Date: Wed, 10 Aug 2022 21:43:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <YvQYjpDHH5KckCrw@casper.infradead.org>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
 <20220729092216.GE3493@suse.de> <20220729141145.GA31605@lst.de>
 <Yufx5jpyJ+zcSJ4e@cmpxchg.org>
MIME-Version: 1.0
In-Reply-To: <Yufx5jpyJ+zcSJ4e@cmpxchg.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 01, 2022 at 11:31:50AM -0400, Johannes Weiner wrote:
> XFS hasn't had a ->writepage call for a while. After LSF I internally
> tested dropping btrfs' callback, and the results looked good: no OOM
> kills with dirty/writeback pages remaining, performance parity. Then I
> went on vacation and Christoph beat me to the patch :)

To avoid duplicating work with you or Christoph ... it seems like the
plan is to kill ->writepage entirely soon, so there's no point in me
doing a sweep of all the filesystems to convert ->writepage to
->write_folio, correct?

I assume the plan for filesystems which have a writepage but don't have
a ->writepages (9p, adfs, affs, bfs, ecryptfs, gfs2, hostfs, jfs, minix,
nilfs2, ntfs, ocfs2, reiserfs, sysv, ubifs, udf, ufs, vboxsf) is to give
them a writepages, modelled on iomap_writepages().  Seems that adding
a block_writepages() might be a useful thing for me to do?

