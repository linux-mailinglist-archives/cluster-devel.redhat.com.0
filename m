Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B607C3CF740
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Jul 2021 11:54:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-31OctYoLMK6DKcrgus0tlA-1; Tue, 20 Jul 2021 05:54:53 -0400
X-MC-Unique: 31OctYoLMK6DKcrgus0tlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13A4B100C661;
	Tue, 20 Jul 2021 09:54:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0A3100EB3E;
	Tue, 20 Jul 2021 09:54:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B801E4EA29;
	Tue, 20 Jul 2021 09:54:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16K9qi7c015775 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Jul 2021 05:52:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A986178B5; Tue, 20 Jul 2021 09:52:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 851C21C64A
	for <cluster-devel@redhat.com>; Tue, 20 Jul 2021 09:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F9C1078461
	for <cluster-devel@redhat.com>; Tue, 20 Jul 2021 09:52:41 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-8lEA4M4PPz29hJtJNnPzkg-1; Tue, 20 Jul 2021 05:52:37 -0400
X-MC-Unique: 8lEA4M4PPz29hJtJNnPzkg-1
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B1DF1FD3E;
	Tue, 20 Jul 2021 09:52:36 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 80D2213AA2;
	Tue, 20 Jul 2021 09:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA id +x0ZHeOc9mCHKgAAGKfGzw
	(envelope-from <nborisov@suse.com>); Tue, 20 Jul 2021 09:52:35 +0000
To: "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-4-hch@lst.de> <20210719160820.GE22402@magnolia>
From: Nikolay Borisov <nborisov@suse.com>
Message-ID: <ab10035a-43ee-8f25-47c0-57321f748abd@suse.com>
Date: Tue, 20 Jul 2021 12:52:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719160820.GE22402@magnolia>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16K9qi7c015775
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 03/27] iomap: mark the iomap argument to
 iomap_sector const
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 19.07.21 г. 19:08, Darrick J. Wong wrote:
> On Mon, Jul 19, 2021 at 12:34:56PM +0200, Christoph Hellwig wrote:
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> /me wonders, does this have any significant effect on the generated
> code?

https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html

> 
> It's probably a good idea to feed the optimizer as much usage info as we
> can, though I would imagine that for such a simple function it can
> probably tell that we don't change *iomap.
> 
> IMHO, constifiying functions is a good way to signal to /programmers/
> that they're not intended to touch the arguments, so
> 
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> --D
> 
>> ---
>>  include/linux/iomap.h | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
>> index 093519d91cc9cc..f9c36df6a3061b 100644
>> --- a/include/linux/iomap.h
>> +++ b/include/linux/iomap.h
>> @@ -91,8 +91,7 @@ struct iomap {
>>  	const struct iomap_page_ops *page_ops;
>>  };
>>  
>> -static inline sector_t
>> -iomap_sector(struct iomap *iomap, loff_t pos)
>> +static inline sector_t iomap_sector(const struct iomap *iomap, loff_t pos)
>>  {
>>  	return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
>>  }
>> -- 
>> 2.30.2
>>
> 


