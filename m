Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CA06CF7D2
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680134189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ynVtF+YOYIyQtBcdE/PIBgbLo/mO1vbRxbSD4nziyRU=;
	b=TBomAo7cCsEfW6F9b5ramizb2bUMB+1/glMvuPIxxwdJXTrwsc7Wqhm0EJNxE7aJvBc2IG
	qbnrfu0QS9w3L+gQqeW0CUqWEgPwphwGvjCemRBcaMXm2Ujcxyx7LJErfru+itHNS1bIIN
	7rj6TqCBnNCqjopJYNHPk8GAOMjOVjk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-56xCo8DXO9ucxiOtOUt14w-1; Wed, 29 Mar 2023 19:56:25 -0400
X-MC-Unique: 56xCo8DXO9ucxiOtOUt14w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BBA6858F09;
	Wed, 29 Mar 2023 23:56:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 048BA14171BB;
	Wed, 29 Mar 2023 23:56:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B0779194658F;
	Wed, 29 Mar 2023 23:56:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8CA7D1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:56:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7AAFD18EC2; Wed, 29 Mar 2023 23:56:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E30440D8
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:56:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A74F8533DF
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:56:22 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-KHzB_VnNOCmfWPljbz1DtQ-1; Wed, 29 Mar 2023 19:56:20 -0400
X-MC-Unique: KHzB_VnNOCmfWPljbz1DtQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id EB42C68C7B; Thu, 30 Mar 2023 01:56:15 +0200 (CEST)
Date: Thu, 30 Mar 2023 01:56:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20230329235615.GA2012@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
 <20230328160433.4f3dc32b480239bce9e2f9ef@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20230328160433.4f3dc32b480239bce9e2f9ef@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] return an ERR_PTR from __filemap_get_folio v2
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 28, 2023 at 04:04:33PM -0700, Andrew Morton wrote:
> > Note that the shmem patches in here are non-trivial and need some
> > careful review and testing.
> 
> How are we going with the review and testing.  I assume that
> we're now OK on the runtime testing front, but do you feel that
> review has been adequate?

Yes, I think we're fine, mostly due to Hugh.  I'm a little sad about
the simplification / descoping from him, but at least we get the main
objective done.  Maybe at some point we can do another pass at
cleaning up the shmem page finding/reading mess.

