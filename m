Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6070E161
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 18:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684857779;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Id1VKkE56aIEmPBnec0ekPBXZTL3cL113Co8IBTMxVE=;
	b=AGQxaWwT52LYRIxNBNizYRDT3dFuNVrfSr1UHUCNbyu0SQXHqDaMDLgxbsgXqaUnXYavcZ
	hlKqEz3YN2TKDTpCCFQE7Envl3Rg8AhcWCVjiwZIHr/aGE2OKTfEUFxr4cBQ9wGH833Lsl
	LSdOoj4DpfHYLP0nTZdtpH8fkwQHefg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-pDCnAeS8PqSNNJE6ncdJew-1; Tue, 23 May 2023 12:02:55 -0400
X-MC-Unique: pDCnAeS8PqSNNJE6ncdJew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7804101A52C;
	Tue, 23 May 2023 16:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2F45140E962;
	Tue, 23 May 2023 16:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96B5719465B3;
	Tue, 23 May 2023 16:02:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34B5419465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 16:02:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2186D40C6CD7; Tue, 23 May 2023 16:02:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 197AA40C6CCC
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 16:02:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02B0F811E7F
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 16:02:53 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-ZQzY4WqrM3uxnpGrcgQLTA-1; Tue, 23 May 2023 12:02:48 -0400
X-MC-Unique: ZQzY4WqrM3uxnpGrcgQLTA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id C16D767373; Tue, 23 May 2023 18:02:44 +0200 (CEST)
Date: Tue, 23 May 2023 18:02:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230523160244.GC15391@lst.de>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-9-hch@lst.de> <20230523010627.GD11598@frogsfrogsfrogs>
 <ZGwza3fdkBHyVG3+@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZGwza3fdkBHyVG3+@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 08/13] iomap: assign
 current->backing_dev_info in iomap_file_buffered_write
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
Cc: NeilBrown <neilb@suse.de>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Miklos Szeredi <miklos@szeredi.hu>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 04:30:51AM +0100, Matthew Wilcox wrote:
> AFAICT (the code went through some metamorphoses in the intervening
> twenty years), the last use of it ended up in current_may_throttle(),
> and it was removed in March 2022 by Neil Brown in commit b9b1335e6403.
> Since then, there have been no users of task->backing_dev_info, and I'm
> pretty sure it can go away.

Oh, nice.  I hadn't noticed it finally went away.  The next iteration
of the series will just remove it.

