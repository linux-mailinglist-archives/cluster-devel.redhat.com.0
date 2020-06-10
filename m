Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DEAFB1F5120
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Jun 2020 11:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591781307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+DkEHrzUkdvaYyHpFkIvV6MDueFXIAyn7kupABnfisI=;
	b=EqP7AWlg8bYEWbrLnhBWzLR+WmuLhwxSL9jLykPpaiIXak4tl10ktWmJVZXEqd2Dap3sSO
	c99qHx1D5dXHKrylwVQv5WtdfeMxBusptKJjh7ahHPPDCAgrtKO6wdYr2iw0yyrqAKnSiN
	JLmxCGN6w/E+H0BnNz4EWFwDm04GQ5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-YE1dD9iNMLWrNqwUg_gxXw-1; Wed, 10 Jun 2020 05:28:24 -0400
X-MC-Unique: YE1dD9iNMLWrNqwUg_gxXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2307F1883600;
	Wed, 10 Jun 2020 09:28:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E62010013C1;
	Wed, 10 Jun 2020 09:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66AB91809554;
	Wed, 10 Jun 2020 09:28:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05A9RCfZ014568 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 05:27:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 860C97B5F4; Wed, 10 Jun 2020 09:27:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD6982036;
	Wed, 10 Jun 2020 09:27:07 +0000 (UTC)
To: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
References: <20200609124102.GB19604@bombadil.infradead.org>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <ec0a0819-4460-179e-b707-a717a841e830@redhat.com>
Date: Wed, 10 Jun 2020 10:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200609124102.GB19604@bombadil.infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Cluster-devel] Disentangling address_space and inode
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/06/2020 13:41, Matthew Wilcox wrote:
> I have a modest proposal ...
>
>   struct inode {
> -	struct address_space i_data;
>   }
>
> +struct minode {
> +	struct inode i;
> +	struct address_space m;
> +};
>
>   struct address_space {
> -	struct inode *host;
>   }
>
> This saves one pointer per inode, and cuts all the pagecache support
> from inodes which don't need to have a page cache (symlinks, directories,
> pipes, sockets, char devices).
>
> This was born from the annoyance of going from a struct page to a filesystem:
> page->mapping->host->i_sb->s_type
>
> That's four pointer dereferences.  This would bring it down to three:
> i_host(page->mapping)->i_sb->s_type
>
> I could see (eventually) interfaces changing to pass around a
> struct minode *mapping instead of a struct address_space *mapping.  But
> I know mapping->host and inode->i_mapping sometimes have some pretty
> weird relationships and maybe there's a legitimate usage that can't be
> handled by this change.
>
> Every filesystem which does use the page cache would have to be changed
> to use a minode instead of an inode, which is why this proposal is so
> very modest.  But before I start looking into it properly, I thought
> somebody might know why this isn't going to work.
>
> I know about raw devices:
>                  file_inode(filp)->i_mapping =
>                          bdev->bd_inode->i_mapping;
>
> and this seems like it should work for that.  I know about coda:
>                  coda_inode->i_mapping = host_inode->i_mapping;
>
> and this seems like it should work there too.
>
> DAX just seems confused:
>          inode->i_mapping = __dax_inode->i_mapping;
>          inode->i_mapping->host = __dax_inode;
>          inode->i_mapping->a_ops = &dev_dax_aops;
>
> GFS2 might need to embed an entire minode instead of just a mapping in its
> glocks and its superblock:
> fs/gfs2/glock.c:                mapping->host = s->s_bdev->bd_inode;
> fs/gfs2/ops_fstype.c:   mapping->host = sb->s_bdev->bd_inode;

I don't think that will scale. We did gain a big reduction in overhead 
for each cached inode when we stopped using two struct inodes and just 
embedded an address_space in the glock. However, I'm fairly sure that 
for the glock address_space case, we already have our own way to find 
the associated inode. So it might well be ok to do this anyway, and not 
need to embed a full minode.

Also, if there was a better way to track metadata on a per inode basis, 
then that would be an even better solution, but a much bigger project too.

The issue that you might run across is for stacked filesystems... will 
you land up finding the correct layer in the stack?

Steve.


>
> NILFS ... I don't understand at all.  It seems to allocate its own
> private address space in nilfs_inode_info instead of using i_data (why?)
> and also allocate more address spaces for metadata inodes.
> fs/nilfs2/page.c:       mapping->host = inode;
>
> So that will need to be understood, but is there a fundamental reason
> this won't work?
>
> Advantages:
>   - Eliminates a pointer dereference when moving from mapping to host
>   - Shrinks all inodes by one pointer
>   - Shrinks inodes used for symlinks, directories, sockets, pipes & char
>     devices by an entire struct address_space.
>
> Disadvantages:
>   - Churn
>   - Seems like it'll grow a few data structures in less common filesystems
>     (but may be important for some users)
>

