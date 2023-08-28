Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5DF78B2C9
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Aug 2023 16:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693232134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3JYn7thNlmLQqnkScFAD85nPybgGPBVIx1IoTQc28Jc=;
	b=G3yJB9UPJiVHM+XL3Jna6HvaqJrYoMrvS+3lj7a5wYz54aXpcsP7oBjee33+FD2yIaP7PE
	/5IR7mjQC/cWk1AvLBWtinO6JxoN6uPYRRPGh0TA1U70I0PMj9CUiON9R4hupBNIpWQRiO
	qjDK675ctsnDQmhdW+SqMVPHKxbqzWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-5aRTs86NPOevjQxzYlNGKQ-1; Mon, 28 Aug 2023 10:15:28 -0400
X-MC-Unique: 5aRTs86NPOevjQxzYlNGKQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E92FD8015AA;
	Mon, 28 Aug 2023 14:15:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B26A8492C14;
	Mon, 28 Aug 2023 14:15:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71B7119465B3;
	Mon, 28 Aug 2023 14:15:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 703801946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 28 Aug 2023 14:15:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 534EA492C14; Mon, 28 Aug 2023 14:15:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C254492C13
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 14:15:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 358982A5956D
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 14:15:26 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-CCU9d8kEMCCUfAn6W0rIKA-1; Mon, 28 Aug 2023 10:15:22 -0400
X-MC-Unique: CCU9d8kEMCCUfAn6W0rIKA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 94DCE68C7B; Mon, 28 Aug 2023 16:15:13 +0200 (CEST)
Date: Mon, 28 Aug 2023 16:15:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20230828141512.GA19883@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de> <20230827194122.GA325446@ZenIV>
 <20230827214518.GU3390869@ZenIV> <20230828123259.GB11084@lst.de>
 <20230828135615.GW3390869@ZenIV>
MIME-Version: 1.0
In-Reply-To: <20230828135615.GW3390869@ZenIV>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2023 at 02:56:15PM +0100, Al Viro wrote:
> The first failure exit does not need any work - the caller had not bumped
> ->ki_pos; the second one (after that 'if (err < 0) {' line) does and that's
> where the patch upthread adds iocb->ki_pos -= buffered_written.
> 
> Or am I completely misparsing what you've written?

No, I misread the patch.  Looks good:

Acked-by: Christoph Hellwig <hch@lst.de>

