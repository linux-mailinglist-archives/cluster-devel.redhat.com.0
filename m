Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CEFD5364BE9
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 22:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618865254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pCTOcHRFBQCexoupHaOSraPXzu62kp54e7UFcxZEpxM=;
	b=Vy8yyXIxuTcug6vw4ZajWJ/dOJh5QqPYaCtXZ+RTPR0VqYY39KpY3Qi1xPKe+J9Umu7Ou1
	t49KVvhV+E75somel6P0GSFkeBbSfaK8GknP0Z9xVccPlPAYKvkl2BglqTh8+7LApHxQ0S
	c6A51xfCqj26WaNRztJF6M/XSxWGgGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-Vq78F-ZwO5iZx4azvCh_5Q-1; Mon, 19 Apr 2021 16:47:33 -0400
X-MC-Unique: Vq78F-ZwO5iZx4azvCh_5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA7118397A4;
	Mon, 19 Apr 2021 20:47:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0470819C66;
	Mon, 19 Apr 2021 20:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 000411806D17;
	Mon, 19 Apr 2021 20:47:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JKlP1L009128 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 16:47:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A66B8138F5; Mon, 19 Apr 2021 20:47:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.37.46] (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C788D60C5F;
	Mon, 19 Apr 2021 20:47:21 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
	<20210419191117.297653-2-anprice@redhat.com>
	<CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <9472a989-1265-65d2-292b-5110176c15c6@redhat.com>
Date: Mon, 19 Apr 2021 21:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 1/8] Import linux/gfs2_ondisk.h
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/04/2021 20:35, Andreas Gruenbacher wrote:
> Andy,
> 
> On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
>> diff --git a/gfs2/include/gfs2_ondisk.h b/gfs2/include/gfs2_ondisk.h
>> new file mode 100644
>> index 00000000..fc948f89
>> --- /dev/null
>> +++ b/gfs2/include/gfs2_ondisk.h
> 
> any reason why this file shouldn't be at gfs2/include/linux/gfs2_ondisk.h?

I didn't feel it was needed, but it does have the benefit of making sure 
we're not picking up the system linux/gfs2_ondisk.h when we #include 
<gfs2_ondisk.h> and it shows clearly that we're not trying to.

Andy

