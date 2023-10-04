Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 512037B7C95
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Oct 2023 11:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696413009;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FATxZIFQ/tMLBd7GlQB8OhXvEUPOJzRMDwnz5ax+9Lg=;
	b=cDu76Cy8Uz4U0zi7Ja+yMACXOaPGHn9aq7Gx3NSp+IYMmjoWLF7khZRUzODklE7it70G3R
	rWCV0V2telhAWbI9AyOhvPiA8iDycZR+pOyand4CjelIAwwLk9S/99eobXdEQjME8CjvxO
	RrxKoeNTMf5wOTkK9KqcIRye3+Vz2y8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-r507-od0ONeRM7ZtT_0IwA-1; Wed, 04 Oct 2023 05:49:57 -0400
X-MC-Unique: r507-od0ONeRM7ZtT_0IwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D894811E92;
	Wed,  4 Oct 2023 09:49:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA4231006B70;
	Wed,  4 Oct 2023 09:49:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1D11219465A0;
	Wed,  4 Oct 2023 09:49:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12F19194658D for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Oct 2023 09:49:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E83EE40107B; Wed,  4 Oct 2023 09:49:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1516402723
 for <cluster-devel@redhat.com>; Wed,  4 Oct 2023 09:49:51 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98BC5101B044
 for <cluster-devel@redhat.com>; Wed,  4 Oct 2023 09:49:51 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-uW7n2sQGPgWNadU4X39dOQ-1; Wed, 04 Oct 2023 05:49:30 -0400
X-MC-Unique: uW7n2sQGPgWNadU4X39dOQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-77422b0e373so228898485a.3
 for <cluster-devel@redhat.com>; Wed, 04 Oct 2023 02:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696412970; x=1697017770;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FATxZIFQ/tMLBd7GlQB8OhXvEUPOJzRMDwnz5ax+9Lg=;
 b=fD3iB85xOLDU+tkttYQdKY3yCcAb3TaX9tTdhzXj5E0hVG3cvYTP3TatyRhiEiQQ1f
 o5HE+xeutt+Xe5v+2w2WWEt75XNKnOyaao3lMh/1CjrGHT3X7iqtnQ8DB2FDm9UYHucb
 +demcw+HSwmle6LNp314iKoaXlxKs1RVXu80V2uHTtRhsgk5taQQdkuwCVHTGIY09vBZ
 Ny2JaR6lOmB/LejdfqRe9oPX7CZBsEZNfL0catfnxR1TOVTglYV9ktTbO3mrRp6VBUtU
 KVj710hqQRjHVqTJXP5uDaVXSysSUb7638TI7fwKeQgHnWDNoDQa3oDRTaI1GL1lH6rq
 qXug==
X-Gm-Message-State: AOJu0YzrWtivUYcdU/MjMSI9eSyhpbW27Q8UBQj4tbg2dCcO/PFHlW54
 YwU6JJ3LZxNadsvV7wVdMgZEUyq5WWXQx8mRTBHNsQ1OMn/mgS9dWTwagRwxo4NDdAB6aPoC/h+
 Faw++2DoPeDn8g/+KgvZXLraQmEJBVO0PWsjt6y1UoH30a5LnpZusXwEQdDaZ9rpIpMS9skc2ev
 3JiIsc
X-Received: by 2002:a05:620a:8da:b0:774:cf9:b206 with SMTP id
 z26-20020a05620a08da00b007740cf9b206mr1848165qkz.42.1696412969781; 
 Wed, 04 Oct 2023 02:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3SCENTzdej0/JWC07YYma35+/nwqc2UC22CZCGYTD5KgMbTZFvUM3XwV7T/vXK3XRdf28Aw==
X-Received: by 2002:a05:620a:8da:b0:774:cf9:b206 with SMTP id
 z26-20020a05620a08da00b007740cf9b206mr1848152qkz.42.1696412969443; 
 Wed, 04 Oct 2023 02:49:29 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05620a075500b00774376e6475sm1135744qki.6.2023.10.04.02.49.28
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 02:49:28 -0700 (PDT)
Message-ID: <f8347be6-f3c7-940b-e9ad-8b6400bec687@redhat.com>
Date: Wed, 4 Oct 2023 10:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: cluster-devel <cluster-devel@redhat.com>
From: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [ANNOUNCE] cluster-devel@redhat.com list shutdown
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Following on from the previous notices about the new list replacing 
cluster-devel, this list will shortly be discontinued.

The list archives have been preserved at 
https://lore.kernel.org/cluster-devel/

If you haven't already done so, please subscribe to the new list for 
gfs2 and dlm development, gfs2@lists.linux.dev, by sending an empty 
message to gfs2+subscribe@lists.linux.dev

Many thanks,
Andy

