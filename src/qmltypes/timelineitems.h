/*
 * Copyright (c) 2015-2016 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _TIMELINEITEMS_H
#define _TIMELINEITEMS_H
#include <QColor>
#include <QQuickPaintedItem>

void registerTimelineItems();

class TimelineTransition : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor colorA MEMBER m_colorA NOTIFY propertyChanged)
    Q_PROPERTY(QColor colorB MEMBER m_colorB NOTIFY propertyChanged)

public:
    TimelineTransition();

    void paint(QPainter *painter);

signals:
    void propertyChanged();

private:
    QColor m_colorA;
    QColor m_colorB;
};

class TimelineWaveform : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QVariant levels MEMBER m_audioLevels NOTIFY propertyChanged)
    Q_PROPERTY(QColor fillColor MEMBER m_color NOTIFY propertyChanged)
    Q_PROPERTY(int inPoint MEMBER m_inPoint NOTIFY inPointChanged)
    Q_PROPERTY(int outPoint MEMBER m_outPoint NOTIFY outPointChanged)

public:
    TimelineWaveform();

    void paint(QPainter *painter);

signals:
    void propertyChanged();
    void inPointChanged();
    void outPointChanged();

private:
    QVariant m_audioLevels;
    int m_inPoint;
    int m_outPoint;
    QColor m_color;
};

#endif
