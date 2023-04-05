Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6D6D858C
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 20:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680717781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dmAZmojKfIM/z2MtFjBGD6EJ+69KjhZ8tshJmiwlSl0=;
	b=azdjD9Mpw9MHB791t0CiG0fxolCGdkGPj1BI0tbvePN652oTZWhaIJen7mO71wTNku0Cun
	USnToVZZB95Nmor1o3jSvihHEm87acDzwO/xZ+8bi/upTTO4FzfUQFj/i6Yp1eLdGRFgcC
	VfZjwu+9xeMhpquwGkblHpNMGggJ0oQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-TE2fi9NVMzKkKS_qiua-eA-1; Wed, 05 Apr 2023 14:02:57 -0400
X-MC-Unique: TE2fi9NVMzKkKS_qiua-eA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AF67185A78B;
	Wed,  5 Apr 2023 18:02:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 151D3202701F;
	Wed,  5 Apr 2023 18:02:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E626D1946597;
	Wed,  5 Apr 2023 18:02:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E8391946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 18:02:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44A6E1121315; Wed,  5 Apr 2023 18:02:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D39C1121314
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 18:02:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BCAE85A588
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 18:02:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-i77VHrM3PwWnd1YKfdVECQ-1; Wed, 05 Apr 2023 14:02:50 -0400
X-MC-Unique: i77VHrM3PwWnd1YKfdVECQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 163C063D9B;
 Wed,  5 Apr 2023 18:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EE1C433D2;
 Wed,  5 Apr 2023 18:02:48 +0000 (UTC)
Date: Wed, 5 Apr 2023 18:02:47 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZC23x22bxItnsANI@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
 <ZC2YsgYRsvBejGYY@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZC2YsgYRsvBejGYY@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v2 19/23] xfs: disable direct read path
 for fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 08:50:10AM -0700, Christoph Hellwig wrote:
> On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong wrote:
> > Thinking about this a little more -- I suppose we shouldn't just go
> > breaking directio reads from a verity file if we can help it.  Is there
> > a way to ask fsverity to perform its validation against some arbitrary
> > memory buffer that happens to be fs-block aligned?

You could certainly add such a function that wraps around verify_data_block().
The minimal function prototype needed (without supporting readahead or reusing
the ahash_request) would be something like the following, I think:

    bool fsverity_verify_blocks_dio(struct inode *inode, u64 pos,
                                    struct folio *folio,
                                    size_t len, size_t offset);

And I really hope that you don't want to do DIO to the *Merkle tree*, as that
would make the problem significantly harder.  I think DIO for the data, but
handling the Merkle tree in the usual way, would be okay?

> 
> That would be my preference as well.  But maybe Eric know a good reason
> why this hasn't been done yet.
> 

I believe it would be possible, especially if DIO to the Merkle tree is not in
scope.  There just hasn't been a reason to the work yet.  And ext4 and f2fs
already fall back to buffer I/O for other filesystem features, so there was
precedent for not bothering with DIO, at least in the initial version.

- Eric

