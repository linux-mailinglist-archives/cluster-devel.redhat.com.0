Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D509A546358
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 12:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654856264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=;
	b=cNlxDVBjviko/Ub4+S8WJshemlcv4GwqKhSaOywP58HW8WY5HAWgTEKy+wXSaqHCollVE1
	n/lYk9ESYp2o3fgfsnI0/crC/2cffIu19RmLTejDKg3FOP2Ea/19HoCMXtoijQVadyo7t4
	XGARYew2t7ewt4jGj+dfbHmiUP3blgE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-LmC--Fw2PQSTF6HrFAizvQ-1; Fri, 10 Jun 2022 06:17:41 -0400
X-MC-Unique: LmC--Fw2PQSTF6HrFAizvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E175B3810D2D;
	Fri, 10 Jun 2022 10:17:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70BBF2166B26;
	Fri, 10 Jun 2022 10:17:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB777194704A;
	Fri, 10 Jun 2022 10:17:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 392A019466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 10:17:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1317A492CA3; Fri, 10 Jun 2022 10:17:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3C3492C3B
 for <cluster-devel@redhat.com>; Fri, 10 Jun 2022 10:17:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EACE01C004EB
 for <cluster-devel@redhat.com>; Fri, 10 Jun 2022 10:17:37 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-bqXRfySkOwKxEa1Uby1Vyw-1; Fri, 10 Jun 2022 06:17:36 -0400
X-MC-Unique: bqXRfySkOwKxEa1Uby1Vyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so1109085wmb.1
 for <cluster-devel@redhat.com>; Fri, 10 Jun 2022 03:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=;
 b=cMQf+Y2e47PXQ//irAchQXbyJXZ2TqYI+QyNIcFClXv0OclvVAhWnJA2hF9z96r7ss
 arF3GfqZflHu4dwUyLLYnU2kahG3/EGxBdj5lL9JbQHKjV2BIlBkoPoa+8PANvcoSSri
 5GvLeOUwFwiymUPNbAkLtd2jacfANNnV/yULOHmbR0giE7snCWyjB2QGbq5iZ/L67lye
 3I6riJaLWs18wOLHctZNkCvmODv6E5WKHjlvkucQirwY3nnHxtsLurDczJX1rkJVZ+lc
 8dk81bECLu1GccjydIvvj0xuaoGJAzR/d1GhFBss756PvsvYCGvwBET7jWYAJHWMN+Dt
 Vy9A==
X-Gm-Message-State: AOAM530sv4FZ+zzkirJLSqOBt3ta+W3uF5GWx0+vqqPXBHamlBXWvHtl
 /C/4h2piscPdcSUwlC8901QNbzQVB6axHN2RorlTiBrc6S2RQ08PIlTKG8efol7FT5GsFpchLTo
 4h0+30lYZYnTlI6MPhi3e2A==
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id
 m17-20020a056000009100b002178efcf572mr29122724wrx.186.1654856255658; 
 Fri, 10 Jun 2022 03:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMoCknlizO69Nl0wuEIzBALIZP/2+KDolU3ne+3dmHgzec6LJk/2XhtTIsrJ35XnXVn7hgfw==
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id
 m17-20020a056000009100b002178efcf572mr29122693wrx.186.1654856255339; 
 Fri, 10 Jun 2022 03:17:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:1f00:4727:6420:1d4d:ca23?
 (p200300cbc7051f00472764201d4dca23.dip0.t-ipconnect.de.
 [2003:cb:c705:1f00:4727:6420:1d4d:ca23])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c4f5100b0039c4f53c4fdsm3105741wmq.45.2022.06.10.03.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 03:17:34 -0700 (PDT)
Message-ID: <e287a12d-29d9-da69-9315-52414341cbd1@redhat.com>
Date: Fri, 10 Jun 2022 12:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Matthew Wilcox <willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-4-willy@infradead.org>
 <b2a81248-03fc-afb3-1041-d8206e95e08a@redhat.com>
 <YqIFHPJZNMrmtXlh@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YqIFHPJZNMrmtXlh@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2 03/19] fs: Add aops->migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.06.22 16:35, Matthew Wilcox wrote:
> On Thu, Jun 09, 2022 at 02:50:20PM +0200, David Hildenbrand wrote:
>> On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
>>> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
>>> index c0fe711f14d3..3d28b23676bd 100644
>>> --- a/Documentation/filesystems/locking.rst
>>> +++ b/Documentation/filesystems/locking.rst
>>> @@ -253,7 +253,8 @@ prototypes::
>>>  	void (*free_folio)(struct folio *);
>>>  	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>>  	bool (*isolate_page) (struct page *, isolate_mode_t);
>>> -	int (*migratepage)(struct address_space *, struct page *, struct page *);
>>> +	int (*migrate_folio)(struct address_space *, struct folio *dst,
>>> +			struct folio *src, enum migrate_mode);
>>>  	void (*putback_page) (struct page *);
>>
>> isolate_page/putback_page are leftovers from the previous patch, no?
> 
> Argh, right, I completely forgot I needed to update the documentation in
> that patch.
> 
>>> +++ b/Documentation/vm/page_migration.rst
>>> @@ -181,22 +181,23 @@ which are function pointers of struct address_space_operations.
>>>     Once page is successfully isolated, VM uses page.lru fields so driver
>>>     shouldn't expect to preserve values in those fields.
>>>  
>>> -2. ``int (*migratepage) (struct address_space *mapping,``
>>> -|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
>>> -
>>> -   After isolation, VM calls migratepage() of driver with the isolated page.
>>> -   The function of migratepage() is to move the contents of the old page to the
>>> -   new page
>>> -   and set up fields of struct page newpage. Keep in mind that you should
>>> -   indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
>>> -   under page_lock if you migrated the oldpage successfully and returned
>>> -   MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
>>> -   can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
>>> -   because VM interprets -EAGAIN as "temporary migration failure". On returning
>>> -   any error except -EAGAIN, VM will give up the page migration without
>>> -   retrying.
>>> -
>>> -   Driver shouldn't touch the page.lru field while in the migratepage() function.
>>> +2. ``int (*migrate_folio) (struct address_space *mapping,``
>>> +|	``struct folio *dst, struct folio *src, enum migrate_mode);``
>>> +
>>> +   After isolation, VM calls the driver's migrate_folio() with the
>>> +   isolated folio.  The purpose of migrate_folio() is to move the contents
>>> +   of the source folio to the destination folio and set up the fields
>>> +   of destination folio.  Keep in mind that you should indicate to the
>>> +   VM the source folio is no longer movable via __ClearPageMovable()
>>> +   under folio if you migrated the source successfully and returned
>>> +   MIGRATEPAGE_SUCCESS.  If driver cannot migrate the folio at the
>>> +   moment, driver can return -EAGAIN. On -EAGAIN, VM will retry folio
>>> +   migration in a short time because VM interprets -EAGAIN as "temporary
>>> +   migration failure".  On returning any error except -EAGAIN, VM will
>>> +   give up the folio migration without retrying.
>>> +
>>> +   Driver shouldn't touch the folio.lru field while in the migrate_folio()
>>> +   function.
>>>  
>>>  3. ``void (*putback_page)(struct page *);``
>>
>> Hmm, here it's a bit more complicated now, because we essentially have
>> two paths: LRU+migrate_folio or !LRU+movable_ops
>> (isolate/migrate/putback page)
> 
> Oh ... actually, this is just documenting the driver side of things.
> I don't really like how it's written.  Here, have some rewritten
> documentation (which is now part of the previous patch):
> 

LGTM, thanks.


-- 
Thanks,

David / dhildenb

