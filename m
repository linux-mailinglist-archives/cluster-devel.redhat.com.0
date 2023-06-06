Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B587237F6
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 08:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686033841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+rhFMcHe3rPQMZLGfmZYoovNgG6jY6X2NeFShgojO/g=;
	b=aVBJCsHC96seFsq6EG3AdbdzQKPf1lAblgYmJAPMJNSlMDx4lDxio6LwN09YJZywXgGeQG
	caPjUtulAdIh0XcTUvmjPe7xEsCZ/oWws480GzZ3a3GScwMoUSbCPJAq3paF+tIQtW9I22
	WywVGBoi3XHeGmGynBg21D0oJLq8AMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-gvherggBOfGwOUPAvCQmTA-1; Tue, 06 Jun 2023 02:43:58 -0400
X-MC-Unique: gvherggBOfGwOUPAvCQmTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35CC7101A52C;
	Tue,  6 Jun 2023 06:43:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 028A31121315;
	Tue,  6 Jun 2023 06:43:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 90D9319465BB;
	Tue,  6 Jun 2023 06:43:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D20E1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 06:43:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 502A62026D6A; Tue,  6 Jun 2023 06:43:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 491B32026D49
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 06:43:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23DD73C025B1
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 06:43:53 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-DiMgFYlXPaeZit5x971EEw-1; Tue, 06 Jun 2023 02:43:49 -0400
X-MC-Unique: DiMgFYlXPaeZit5x971EEw-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 294C46732D; Tue,  6 Jun 2023 08:43:44 +0200 (CEST)
Date: Tue, 6 Jun 2023 08:43:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230606064343.GA27497@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-10-hch@lst.de>
 <20230606000414.GJ1325469@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230606000414.GJ1325469@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 09/12] fs: factor out a
 direct_write_fallback helper
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
Cc: linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 05:04:14PM -0700, Darrick J. Wong wrote:
> On Thu, Jun 01, 2023 at 04:59:01PM +0200, Christoph Hellwig wrote:
> > Add a helper dealing with handling the syncing of a buffered write fallback
> > for direct I/O.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>
> 
> Looks good to me; whose tree do you want this to go through?

Andrew has already picked them up.

