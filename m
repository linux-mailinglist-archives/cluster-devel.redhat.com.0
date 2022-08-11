Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9358F769
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Aug 2022 07:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660197510;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JJKpJkz4J31Xc1FOEek4ONIECUiUyXQKOZDozSH+Hu8=;
	b=EJMJ5QK9cbrIzNeJiL1aW7oxZHWYd1bZH2PnkLyEgLXZB/JOyOx6FELRIbkpLMXbgI1xdS
	gf1Qg6hYIZeBR+GYG3inTXZhY+JFZU2ADHf3QQ+MfGH6FqYJBcop8vKqHZ0aUoimyf9+TO
	zWDG5E4T8N5yuaNlQWKD7BhGCwLlPos=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-ydQC-tSXNJSkks1WJOySBA-1; Thu, 11 Aug 2022 01:58:25 -0400
X-MC-Unique: ydQC-tSXNJSkks1WJOySBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69F2C1C09042;
	Thu, 11 Aug 2022 05:58:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5940C15BA1;
	Thu, 11 Aug 2022 05:58:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E2421946A56;
	Thu, 11 Aug 2022 05:58:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2602A1946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 11 Aug 2022 05:58:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C9BB112131B; Thu, 11 Aug 2022 05:58:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 089601121319
 for <cluster-devel@redhat.com>; Thu, 11 Aug 2022 05:58:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E47A53810D39
 for <cluster-devel@redhat.com>; Thu, 11 Aug 2022 05:58:20 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-_Nj9OGh5NA2tvkxkxo5mog-1; Thu, 11 Aug 2022 01:58:16 -0400
X-MC-Unique: _Nj9OGh5NA2tvkxkxo5mog-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2AF2968AA6; Thu, 11 Aug 2022 07:58:12 +0200 (CEST)
Date: Thu, 11 Aug 2022 07:58:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20220811055811.GA12359@lst.de>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3> <20220729092216.GE3493@suse.de>
 <20220729141145.GA31605@lst.de> <Yufx5jpyJ+zcSJ4e@cmpxchg.org>
 <YvQYjpDHH5KckCrw@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YvQYjpDHH5KckCrw@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 Johannes Weiner <hannes@cmpxchg.org>, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 09:43:58PM +0100, Matthew Wilcox wrote:
> To avoid duplicating work with you or Christoph ... it seems like the
> plan is to kill ->writepage entirely soon, so there's no point in me
> doing a sweep of all the filesystems to convert ->writepage to
> ->write_folio, correct?

While I won't commit to concrete definition of "soon" I think that is
the general plan, and I don't think converting ->writepage to
->write_folio is needed.

> I assume the plan for filesystems which have a writepage but don't have
> a ->writepages (9p, adfs, affs, bfs, ecryptfs, gfs2, hostfs, jfs, minix,
> nilfs2, ntfs, ocfs2, reiserfs, sysv, ubifs, udf, ufs, vboxsf) is to give
> them a writepages,

and  ->migrate_folio if missing, yes.

> modelled on iomap_writepages().  Seems that adding
> a block_writepages() might be a useful thing for me to do?

We have mpage_writepages which basically is the ->writepages counterpart
to block_write_full_page.  The only caveat is of course that it can
use multi-block mappings from the get_bock callback, so we need to make
sure the file systems don't do anything stupid there.

