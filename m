Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA696ECC0E
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 14:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682339479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=l7hQoBJfzkfgPB29S154KGrGt0ixs3oVFi/jSX9Pzms=;
	b=JyAfebT1AXZ40zxS74//5q9xGVSG8/H4VyBTNqSS0ILZz2ffSNyP7opeohOMlinTSdMuop
	XpqIy2OJuNZKiwPsW4oLWr/dNE+BQc2HbWYU0cmfWnHNvKEP9GYRde4XBVduxkvEgdlI+V
	/uXqkrAKRRTLpTyBAmxGlQAKGmeusDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-_9kPVrb1OyKPra86eQF1MA-1; Mon, 24 Apr 2023 08:31:17 -0400
X-MC-Unique: _9kPVrb1OyKPra86eQF1MA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC3F3185A794;
	Mon, 24 Apr 2023 12:31:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61615492C18;
	Mon, 24 Apr 2023 12:31:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21383194658F;
	Mon, 24 Apr 2023 12:31:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FA271946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 12:31:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 80A3614171BB; Mon, 24 Apr 2023 12:31:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 789D214171BA
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 12:31:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C77B101A531
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 12:31:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-Z1wLsYXlMlK2Xxn7IoTQ3w-1; Mon,
 24 Apr 2023 08:31:04 -0400
X-MC-Unique: Z1wLsYXlMlK2Xxn7IoTQ3w-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pqvLM-000RHP-Lv; Mon, 24 Apr 2023 12:30:56 +0000
Date: Mon, 24 Apr 2023 13:30:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZEZ2gCYFlurJfeDE@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230424054926.26927-4-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 03/17] fs: rename and move
 block_page_mkwrite_return
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
Cc: Jens Axboe <axboe@kernel.dk>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2023 at 07:49:12AM +0200, Christoph Hellwig wrote:
> block_page_mkwrite_return is neither block nor mkwrite specific, and
> should not be under CONFIG_BLOCK.  Move it to mm.h and rename it to
> errno_to_vmfault.

Could you move it about 300 lines down and put it near vmf_error()
so we think about how to unify the two at some point?

Perhaps it should better be called vmf_fs_error() for now since the
errnos it handles are the kind generated by filesystems.

> +++ b/include/linux/mm.h
> @@ -3061,6 +3061,19 @@ extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>  		pgoff_t start_pgoff, pgoff_t end_pgoff);
>  extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
>  
> +/* Convert errno to return value from ->page_mkwrite() call */
> +static inline vm_fault_t errno_to_vmfault(int err)
> +{
> +	if (err == 0)
> +		return VM_FAULT_LOCKED;
> +	if (err == -EFAULT || err == -EAGAIN)
> +		return VM_FAULT_NOPAGE;
> +	if (err == -ENOMEM)
> +		return VM_FAULT_OOM;
> +	/* -ENOSPC, -EDQUOT, -EIO ... */
> +	return VM_FAULT_SIGBUS;
> +}
> +
>  extern unsigned long stack_guard_gap;

