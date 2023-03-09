Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D226B2867
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678374544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ihXG5MFd4C/sJ66P4Uu7lJlcTGQSiyrIw/GrzXzqCEU=;
	b=J8Yub7Q0E3QyLJbwoHzttyd/67m9TOANBmfpZ7Tcdw8qn8hJeXHmC996Z1Qb1/e1xPETBq
	Q9PwVUamPw1r9NjIr662jmZbP4m2r1iQpxJ65J8VCp7ljC3SB9tUWBkQGtXJI6GyLVZWMe
	XAxzLCqGebO9fzuZhqB8x5zlDJ/Kit8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-ixOFU8bqMSq58nbDV7YuDw-1; Thu, 09 Mar 2023 10:09:01 -0500
X-MC-Unique: ixOFU8bqMSq58nbDV7YuDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7EF3857A93;
	Thu,  9 Mar 2023 15:08:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7B8A1121314;
	Thu,  9 Mar 2023 15:08:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 32A5E19465BB;
	Thu,  9 Mar 2023 15:08:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E98B51946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:08:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D94334010E36; Thu,  9 Mar 2023 15:08:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1FE64014D1D
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:08:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5A4C1C294E7
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:08:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-2RW3OMXuNLKR2rk8ry9zTQ-1; Thu, 09 Mar 2023 10:08:52 -0500
X-MC-Unique: 2RW3OMXuNLKR2rk8ry9zTQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC53EB81F6E;
 Thu,  9 Mar 2023 14:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AD1C4339B;
 Thu,  9 Mar 2023 14:58:41 +0000 (UTC)
Date: Thu, 9 Mar 2023 15:58:38 +0100
From: Christian Brauner <brauner@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230309145838.pgkkkhp4ahvqdkv5@wittgenstein>
References: <20230309124035.15820-1-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230309124035.15820-1-frank.li@vivo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 1/5] fs: add i_blockmask()
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
Cc: tytso@mit.edu, joseph.qi@linux.alibaba.com, mark@fasheh.com,
 chao@kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 huyue2@coolpad.com, adilger.kernel@dilger.ca, jlbec@evilplan.org,
 jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org, xiang@kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, viro@zeniv.linux.org.uk
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 09, 2023 at 08:40:31PM +0800, Yangtao Li wrote:
> Introduce i_blockmask() to simplify code, which replace
> (i_blocksize(node) - 1). Like done in commit
> 93407472a21b("fs: add i_blocksize()").
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Looks good but did you forget to convert fs/remap_range.c by any chance?

static int generic_remap_check_len(struct inode *inode_in,
                                   struct inode *inode_out,
                                   loff_t pos_out,
                                   loff_t *len,
                                   unsigned int remap_flags)
{
        u64 blkmask = i_blocksize(inode_in) - 1;

