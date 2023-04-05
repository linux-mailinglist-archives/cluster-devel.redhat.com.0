Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6D6D828A
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 17:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680709823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=L2Oxdk6Soo+QR4xtEQGW5VILqYT7VRJvcfzUGwIeljQ=;
	b=OABuZUtZCIUVi+CByLe7wyEnVnmjVMwzdUIlt6AjbY6UVzW/bx5rU5vs3qdHjCM4YEl6/O
	Er9jCm60axjKg1SgphPG+S9qkAc7s9O6eEa5kEGvnc1J4xBxSWOofQJPh6psAOZazPIsLq
	mAaTM1CW102KyI0t746SCpoHdcMl3+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-OdXZ65fDOlqLWxN__G-P-A-1; Wed, 05 Apr 2023 11:50:21 -0400
X-MC-Unique: OdXZ65fDOlqLWxN__G-P-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29004886065;
	Wed,  5 Apr 2023 15:50:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E09C18EC7;
	Wed,  5 Apr 2023 15:50:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8E9F19465A4;
	Wed,  5 Apr 2023 15:50:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F58B194658F for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 15:50:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 517A2440D9; Wed,  5 Apr 2023 15:50:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 492F6440BC
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:50:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254E085530C
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-lCIRdWvHPcOBM7p8_inp0Q-1; Wed, 05 Apr 2023 11:50:13 -0400
X-MC-Unique: lCIRdWvHPcOBM7p8_inp0Q-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pk5Ok-0050qZ-1c; Wed, 05 Apr 2023 15:50:10 +0000
Date: Wed, 5 Apr 2023 08:50:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ZC2YsgYRsvBejGYY@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230405150927.GD303486@frogsfrogsfrogs>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: fsverity@lists.linux.dev, jth@kernel.org, linux-ext4@vger.kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong wrote:
> Thinking about this a little more -- I suppose we shouldn't just go
> breaking directio reads from a verity file if we can help it.  Is there
> a way to ask fsverity to perform its validation against some arbitrary
> memory buffer that happens to be fs-block aligned?

That would be my preference as well.  But maybe Eric know a good reason
why this hasn't been done yet.

