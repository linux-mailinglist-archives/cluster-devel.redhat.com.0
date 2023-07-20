Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF775AE41
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689855775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qJeevWCTbOxeUOBTAxfygV2zVKl4pRNiVV/Sn4Vc5g8=;
	b=M2N4AHvRUubmnjd7O3W/fAWSo4fDGak6USzrRbj5Jx0wD11oPJ5ufu7wCpDy7/mW4Aue0d
	HJGBunMMElw7g7haR38dee85DwwRiNv0Lbs/vt9Or5so2kR6DYzJOuLfHVNaSEQ3nTegjT
	IdR11vgu4AdHxle89WX8Kxfg868XLOk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-jiUJeu63PbG24pyE1Chg2g-1; Thu, 20 Jul 2023 08:22:49 -0400
X-MC-Unique: jiUJeu63PbG24pyE1Chg2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA1B91044591;
	Thu, 20 Jul 2023 12:22:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73C162166B25;
	Thu, 20 Jul 2023 12:22:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DF2A1946A6A;
	Thu, 20 Jul 2023 12:22:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F1EA219465BA for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:22:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFEC9200B41D; Thu, 20 Jul 2023 12:22:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D789E200C0F2
 for <cluster-devel@redhat.com>; Thu, 20 Jul 2023 12:22:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC1AA3C0C4A1
 for <cluster-devel@redhat.com>; Thu, 20 Jul 2023 12:22:31 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-X2-v_0TeOO2N9-eRlVRBRw-1; Thu,
 20 Jul 2023 08:22:30 -0400
X-MC-Unique: X2-v_0TeOO2N9-eRlVRBRw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 311FA22BEC;
 Thu, 20 Jul 2023 12:16:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17569138EC;
 Thu, 20 Jul 2023 12:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V/cVBa0luWQKJgAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 20 Jul 2023 12:16:45 +0000
Message-ID: <2fda17af-ed88-2332-27a1-61496f943e91@suse.de>
Date: Thu, 20 Jul 2023 14:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Christoph Hellwig <hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
 <20230720120650.GA13266@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230720120650.GA13266@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 16/17] block: use iomap for writes to
 block devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.de
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/23 14:06, Christoph Hellwig wrote:
> On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote:
>> I'm hitting this during booting:
>> [    5.016324]  <TASK>
>> [    5.030256]  iomap_iter+0x11a/0x350
>> [    5.030264]  iomap_readahead+0x1eb/0x2c0
>> [    5.030272]  read_pages+0x5d/0x220
>> [    5.030279]  page_cache_ra_unbounded+0x131/0x180
>> [    5.030284]  filemap_get_pages+0xff/0x5a0
>> [    5.030292]  filemap_read+0xca/0x320
>> [    5.030296]  ? aa_file_perm+0x126/0x500
>> [    5.040216]  ? touch_atime+0xc8/0x150
>> [    5.040224]  blkdev_read_iter+0xb0/0x150
>> [    5.040228]  vfs_read+0x226/0x2d0
>> [    5.040234]  ksys_read+0xa5/0xe0
>> [    5.040238]  do_syscall_64+0x5b/0x80
>>
>> Maybe we should consider this patch:
> 
> As willy said this should be taken care of by the i_size check.
> Did you run with just this patch set or some of the large block
> size experiments on top which might change the variables?
> 
> I'll repost the series today without any chances in the area, and
> if you can reproduce it with just that series we need to root
> cause it, so please send your kernel and VM config along for the
> next report.

I _think_ it's been resolve now; I've rewritten my patchset (and the 
patches where it's based upon) several times now, so it might be a stale 
issue now.

Eagerly awaiting your patchset.

Cheers,

Hannes

