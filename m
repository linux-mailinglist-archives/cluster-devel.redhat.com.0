Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BDDA5261133
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Sep 2020 14:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599567674;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8zG/b9SNlfNr01Zokf08lXs9/jIyKpsY8tZKjKpImbs=;
	b=AvumTyYbTQxlLMPeiZXzCgyUoDPHlY48XAlNqm1v6CWoa7WR24k35x8FG2S4NQBelxiPhf
	hObGGNsX0+ENC8o+mVzW6Pto6Da3waJyIc9ct32uF7GQ5aX28/wIZXg9Oz5CwE2FRirH4B
	+RKTPKfqCB+5F8eIHusEQgANGhVpmt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-7z-ao6J0P5qWrU8j85qZRQ-1; Tue, 08 Sep 2020 08:21:13 -0400
X-MC-Unique: 7z-ao6J0P5qWrU8j85qZRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C605E18BFEDE;
	Tue,  8 Sep 2020 12:21:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1137860E1C;
	Tue,  8 Sep 2020 12:21:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 532BF7A004;
	Tue,  8 Sep 2020 12:21:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088CL1Cm012575 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 08:21:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CD195C1BB; Tue,  8 Sep 2020 12:21:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 842E95C221;
	Tue,  8 Sep 2020 12:20:56 +0000 (UTC)
To: Valentin Vidic <vvidic@debian.org>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
	<20200903223932.GK8773@valentin-vidic.from.hr>
	<06377e85-04f1-d828-9e75-d81629fcd59c@redhat.com>
	<20200904061827.GL8773@valentin-vidic.from.hr>
	<ef84ca52-ea0b-ecda-b1b8-2d33a4480c83@redhat.com>
	<20200904174205.GQ8773@valentin-vidic.from.hr>
	<077d4fb3-5642-f050-f68c-fb23964c3e02@redhat.com>
	<20200907212201.GS8773@valentin-vidic.from.hr>
From: Andrew Price <anprice@redhat.com>
Message-ID: <e9e91d5d-d810-6c88-b19e-3edf45d4d493@redhat.com>
Date: Tue, 8 Sep 2020 13:20:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907212201.GS8773@valentin-vidic.from.hr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.3.0 released
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 07/09/2020 22:22, Valentin Vidic wrote:
> On Mon, Sep 07, 2020 at 02:00:41PM +0100, Andrew Price wrote:
>> It should be consistent if it's the same alignment issue, I think. Perhaps
>> the build machines are different flavours of arm?
> 
> That is possible, second build was scheduled on a different machine.
> 
>> Could you give this one a try:
>>
>> https://pagure.io/gfs2-utils/c/eb102019?branch=andyp-restore-init-align
> 
> Thanks, tests look good again on sparc64 with this patch applied:
> 
> gfs2_edit tests
> 
>   31: Save/restoremeta, defaults                      ok
>   32: Save/restoremeta, no compression                ok
>   33: Save/restoremeta, min. block size               ok
>   34: Save/restoremeta, 4 journals                    ok
>   35: Save/restoremeta, min. block size, 4 journals   ok
>   36: Save metadata to /dev/null                      ok
> 

Thanks for testing. I've pushed the patch to master.

Thinking about all the other cast-align warnings, we might be able to 
replace many of our be*_to_cpu() calls with functions that take a char* 
instead of integer types, so that we never have to cast char* to 
uint{16,32,64}_t* and widen the alignment when reading the on-disk 
structures. That should tidy up a lot of code too as we wouldn't need 
intermediate pointers. I'll look into it.

Andy

