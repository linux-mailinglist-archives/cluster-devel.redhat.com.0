Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBE678609
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Jan 2023 20:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674501503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LB+L+utv/cDjzWqbemZ5ANVNCUgUpSnHnn1bZRYaO6g=;
	b=CpjHU+2L1azrH6+DhYDMUP2PmlmRqvCSxlT6CKNzkKneiekjONX3XGdrt0LoRR6oab0DMe
	i4rLCiDXAYuOMpPXfT1TP87m55n7IIVuC7nOl9jSUPKDsEsOv+wx7r7eRkC3wM2Mm+Y7Rh
	k5b3HrgOtnm8MCuBvuPNiFqrJkX8NVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-YadhDcI9NCCg_U5EpeKArQ-1; Mon, 23 Jan 2023 14:18:21 -0500
X-MC-Unique: YadhDcI9NCCg_U5EpeKArQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5B501014708;
	Mon, 23 Jan 2023 19:18:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5184492B03;
	Mon, 23 Jan 2023 19:18:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 763DF1946594;
	Mon, 23 Jan 2023 19:18:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12EB91946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 23 Jan 2023 19:18:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C8C331410F36; Mon, 23 Jan 2023 19:18:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCF6140EBF4
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 19:18:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89273806629
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 19:18:18 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-v95nde4vMHuRwGuPHJzmnQ-1; Mon, 23 Jan 2023 14:18:17 -0500
X-MC-Unique: v95nde4vMHuRwGuPHJzmnQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2BE9F68C7B; Mon, 23 Jan 2023 20:18:13 +0100 (CET)
Date: Mon, 23 Jan 2023 20:18:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20230123191813.GA16510@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
 <20230121170641.121f4224a0e8304765bb4738@linux-foundation.org>
 <20230122072006.GA3654@lst.de>
 <20230123105945.958075d46b0a05ffd545e276@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20230123105945.958075d46b0a05ffd545e276@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 23, 2023 at 10:59:45AM -0800, Andrew Morton wrote:
> On Sun, 22 Jan 2023 08:20:06 +0100 Christoph Hellwig <hch@lst.de> wrote:
> 
> > On Sat, Jan 21, 2023 at 05:06:41PM -0800, Andrew Morton wrote:
> > > This patchset doesn't apply to fs/btrfs/ because linux-next contains
> > > this 6+ month-old commit:
> > 
> > Hmm.  It was literally written against linux-next as of last morning,
> > which does not have that commit.
> 
> Confused.  According to 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/btrfs/disk-io.c#n4023
> 
> it's there today.  wait_dev_supers() has been foliofied.

Yes, it's there now.  But I'm pretty sure it wasn't there when
I did the last rebase.  Weird.

