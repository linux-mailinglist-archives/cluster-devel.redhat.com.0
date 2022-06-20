Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8B55103A
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jun 2022 08:22:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-c7Du6baPPGaVkezN87p7Dg-1; Mon, 20 Jun 2022 02:21:58 -0400
X-MC-Unique: c7Du6baPPGaVkezN87p7Dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF1F983397F;
	Mon, 20 Jun 2022 06:21:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ED05C08F22;
	Mon, 20 Jun 2022 06:21:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F25371947071;
	Mon, 20 Jun 2022 06:21:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49D0B1947069 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 20 Jun 2022 06:21:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E2002026D2D; Mon, 20 Jun 2022 06:21:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 293772026985
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 06:21:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12848801E6B
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 06:21:54 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-yOg4FsApMdGjzO2BCzDMBg-1; Mon, 20 Jun 2022 02:21:50 -0400
X-MC-Unique: yOg4FsApMdGjzO2BCzDMBg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 83BF96732D; Mon, 20 Jun 2022 08:21:47 +0200 (CEST)
Date: Mon, 20 Jun 2022 08:21:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20220620062147.GB10640@lst.de>
References: <20220619070559.GA27401@lst.de>
 <Yq8TShTaJ6xn6Koi@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Yq8TShTaJ6xn6Koi@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] gfs2 is unhappy on pagecache/for-next
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 19, 2022 at 01:15:06PM +0100, Matthew Wilcox wrote:
> On Sun, Jun 19, 2022 at 09:05:59AM +0200, Christoph Hellwig wrote:
> > When trying to run xfstests on gfs2 (locally with the lock_nolock
> > cluster managed) the first mount already hits this warning in
> > inode_to_wb called from mark_buffer_dirty.  This all seems standard
> > code from folio_account_dirtied, so not sure what is going there.
> 
> I don't think this is new to pagecache/for-next.
> https://lore.kernel.org/linux-mm/cf8bc8dd-8e16-3590-a714-51203e6f4ba9@redhat.com/

Indeed, I can reproduce this on mainline as well.  I just didn't
expect a maintained file system to blow up on the very first mount
in xfstests..

