Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F27099AA
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 16:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684506540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0+VZ1HyTsuRdYwi+hWd9cIzn7uyvdspX3l+sCDgOvwM=;
	b=MJxtznlc8ihq44rlyjQUnk6HmbwgXRS1sNdNJr0XLNriVATz7JrlT8w5vHUOYfpQojghii
	0atErft+JKKMcbYy1oKSrsQPMT8py4XSSDFaBRzlekA8u6tVOJL6C2YzhoqUGt2aQLST4O
	X1vrATs6QymLkP6xhXnKFAh7JacPVD0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-Pgqj5NgmNDal5Q8vFsHtlg-1; Fri, 19 May 2023 10:28:54 -0400
X-MC-Unique: Pgqj5NgmNDal5Q8vFsHtlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 872221C1742B;
	Fri, 19 May 2023 14:28:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA65A7AF5;
	Fri, 19 May 2023 14:28:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D68019465BC;
	Fri, 19 May 2023 14:28:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2BE919465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 14:24:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76CC61121315; Fri, 19 May 2023 14:24:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6E31121314
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 14:24:05 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53C4C811E88
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 14:24:05 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-xHYLLp8oN9mv2uOzkym7RQ-1; Fri,
 19 May 2023 10:24:03 -0400
X-MC-Unique: xHYLLp8oN9mv2uOzkym7RQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48C7922179;
 Fri, 19 May 2023 14:17:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7D5313A12;
 Fri, 19 May 2023 14:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cB26M+yEZ2ThHQAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 19 May 2023 14:17:16 +0000
Message-ID: <adb6e8d5-9bc5-e988-f21a-1c3e5191e66b@suse.de>
Date: Fri, 19 May 2023 16:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-2-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230424054926.26927-2-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Fri, 19 May 2023 14:28:30 +0000
Subject: Re: [Cluster-devel] [PATCH 01/17] fs: unexport
 buffer_check_dirty_writeback
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.de
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/23 07:49, Christoph Hellwig wrote:
> buffer_check_dirty_writeback is only used by the block device aops,
> remove the export.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/buffer.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 9e1e2add541e07..eb14fbaa7d35f7 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -111,7 +111,6 @@ void buffer_check_dirty_writeback(struct folio *folio,
>   		bh = bh->b_this_page;
>   	} while (bh != head);
>   }
> -EXPORT_SYMBOL(buffer_check_dirty_writeback);
>   
>   /*
>    * Block until a buffer comes unlocked.  This doesn't stop it

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes

